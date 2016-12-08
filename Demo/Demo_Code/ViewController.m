- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    boomFBNativeRetryCounter=0;
    boomNativeRetryCounter=0;
    isBoomNativeOkToLoad=NO;
    isFBNativeOkToLoad=YES;
    
    //clear teads index paths
    [[AdNetworksManager sharedInstance] clearTeadsTableViewIndexPaths];
    [[AdNetworksManager sharedInstance] setDelegate:self];

    //try to pre load
    CGRect mainBounds = [[UIScreen mainScreen] bounds];
    CGRect nativeAdFrame = CGRectMake(0, 0, mainBounds.size.width, IS_IPAD ? 540 : 300);
    mediatedNativeAdProperties = [[BMNativeAdProperties alloc] init];
    mediatedNativeAdProperties.FBTemplate = Custom1;
    mediatedNativeAdProperties.nativeAdFrame = nativeAdFrame;
    [[AdNetworksManager sharedInstance] loadMediatedNativeAdWithFirstAd:kBoomAds Properties:mediatedNativeAdProperties];

    ....
}


- (void)viewDidAppear:(BOOL)animated
{
    .....
    [[AdNetworksManager sharedInstance] viewDidAppear:self];
    [super viewDidAppear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
    .....
    
    [super viewDidDisappear:animated];
    [[AdNetworksManager sharedInstance] viewDidDisappear:self];
}


- (UITableViewCell*)tableView:(UITableView*)tableView cellForRowAtIndexPath:(NSIndexPath*)indexPath
{
    @autoreleasepool {

        NSMutableDictionary* dictData;

        if ([APP_DELEGATE.arrHomeFeed count] > indexPath.row) {
            dictData = [[NSMutableDictionary alloc] initWithDictionary:[APP_DELEGATE.arrHomeFeed objectAtIndex:indexPath.row]];
        }

        if ([[dictData valueForKey:@"IsAdvertisement"] intValue] == 0) {
        .......
        }
        else {
            //container for boom native ad views
            if (boomNativeAdViews == nil) {
                boomNativeAdViews = [[NSMutableDictionary alloc] init];
            }

            AdNetworksType type = [[dictData valueForKey:kKeyNativeAdType] intValue];

            UITableViewCell* adCell = [tblData dequeueReusableCellWithIdentifier:@"adCellIndentifierNative"];
            if (adCell == nil) {
                adCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"adCellIndentifierNative"];
            }
            for (UIView* view in [adCell subviews]) {
                [view removeFromSuperview];
            }
            adCell.selectionStyle = UITableViewCellSelectionStyleNone;

            UIView* preLoadedFB = [[AdNetworksManager sharedInstance] preStoredMediatedNativeAdWithType:kFacebook];

            NSArray* arrayPreLoadedBoom = [[AdNetworksManager sharedInstance] preStoredNativeAdsWithType:kBoomAds];
            if (preLoadedBoom==nil && arrayPreLoadedBoom && arrayPreLoadedBoom.count>0) {
                preLoadedBoom=[[AdNetworksManager sharedInstance] preStoredMediatedNativeAdWithType:kBoomAds];
            } else if (arrayPreLoadedBoom==nil && isBoomNativeOkToLoad && boomNativeRetryCounter<3) {
                isBoomNativeOkToLoad=NO;
                [[AdNetworksManager sharedInstance] loadMediatedNativeAdWithFirstAd:kBoomAds Properties:mediatedNativeAdProperties];
            }
            
            if (preLoadedFB==nil && isFBNativeOkToLoad && boomFBNativeRetryCounter<3) {
                isFBNativeOkToLoad=NO;
                [[AdNetworksManager sharedInstance] loadMediatedNativeAdWithFirstAd:kFacebook Properties:mediatedNativeAdProperties];
            } else if ([[AdNetworksManager sharedInstance] preStoredMediatedNativeAdCountWithType:kFacebook]<3 && isFBNativeOkToLoad && boomFBNativeRetryCounter<3) {
                isFBNativeOkToLoad=NO;
                [[AdNetworksManager sharedInstance] loadMediatedNativeAdWithFirstAd:kFacebook Properties:mediatedNativeAdProperties];
            }
            
            if (type==kBoomAds && preLoadedBoom) {
                BMNativeAdView *preLoaded=(BMNativeAdView*)preLoadedBoom;
                BMNativeAdView *boom=nil;
                
                if ([boomNativeAdViews objectForKey:indexPath]==nil) {
                    boom=[[BMNativeAdView alloc] initNativeAdWithData:[preLoaded nativeAdData] Properties:mediatedNativeAdProperties isAlreadyFetched:YES ThumbnailImageData:[preLoaded getThumbnailImageData] SponsorIconData:[preLoaded getSponsorIconData]];
                    [boomNativeAdViews setObject:boom forKey:indexPath];
                } else {
                    boom=[boomNativeAdViews objectForKey:indexPath];
                }
                
                [adCell addSubview:boom];
                
            } else if (type==kFacebook && preLoadedFB) {
                BoomFBNativeAdUITemplate1 *fb=(BoomFBNativeAdUITemplate1*)preLoadedFB;
                [adCell addSubview:fb];
            } else if (type==kTeads) {
                if (tblData && [APP_DELEGATE.arrHomeFeed count]>0) {
                    if (isTeadsLoading==false) {
                        isTeadsLoading=true;
                        //[[AdNetworksManager sharedInstance] createTeadsInReadWithTableView:tblData IndexPath:indexPath];
                    }
                }
                
            } else if (type==kBoomAds && preLoadedBoom==nil && preLoadedFB) {
                [adCell addSubview:preLoadedFB];
            } else if (type==kFacebook && preLoadedFB==nil && preLoadedBoom) {
                BMNativeAdView *preLoaded=(BMNativeAdView*)preLoadedBoom;
                BMNativeAdView *boom=nil;
                
                if ([boomNativeAdViews objectForKey:indexPath]==nil) {
                    boom=[[BMNativeAdView alloc] initNativeAdWithData:[preLoaded nativeAdData] Properties:mediatedNativeAdProperties isAlreadyFetched:YES ThumbnailImageData:[preLoaded getThumbnailImageData] SponsorIconData:[preLoaded getSponsorIconData]];
                    [boomNativeAdViews setObject:boom forKey:indexPath];
                } else {
                    boom=[boomNativeAdViews objectForKey:indexPath];
                }
                [adCell addSubview:boom];
            }
            if ((preLoadedBoom || preLoadedFB) && type!=kTeads) {
                UIView *divider=[[UIView alloc] initWithFrame:CGRectMake(0, mediatedNativeAdProperties.nativeAdFrame.size.height, mediatedNativeAdProperties.nativeAdFrame.size.width, 8)];
                
                UIColor *color=[UIColor colorWithRed:0.8275 green:0.8392 blue:0.8667 alpha:1.0];
                [divider setBackgroundColor:color];
                [adCell addSubview:divider];
            }

            return adCell;
        }
    }
}

- (CGFloat)tableView:(UITableView*)tableView heightForRowAtIndexPath:(NSIndexPath*)indexPath
{
    NSMutableDictionary* dictHomeData;

    if ([APP_DELEGATE.arrHomeFeed count] > indexPath.row) {
        dictHomeData = [[NSMutableDictionary alloc] initWithDictionary:[APP_DELEGATE.arrHomeFeed objectAtIndex:indexPath.row]];

        int IsAdvertisement = [[dictHomeData valueForKey:@"IsAdvertisement"] intValue];
        if (IsAdvertisement == 1) {
            AdNetworksType type = [[dictHomeData valueForKey:kKeyNativeAdType] intValue];

            UIView* boom = [[AdNetworksManager sharedInstance] preStoredMediatedNativeAdWithType:kBoomAds];
            UIView* fb = [[AdNetworksManager sharedInstance] preStoredMediatedNativeAdWithType:kFacebook];
            if (boom == nil && fb == nil) {
                return 0;
            }
            if (type == kTeads) {
                return 0;
            }
            return mediatedNativeAdProperties.nativeAdFrame.size.height + 8;
        }
    }

    return UITableViewAutomaticDimension;
}

- (void)WSResponse:(id)response Error:(NSError*)error ReqType:(WSRequestType)type
{
......
#pragma mark - Native Ad: refresh insert native ad
        [self insertNativeAds];
......
}


#pragma mark - INSERT NATIVE ADS ON TABLE VIEW DATA
- (void)insertNativeAds
{
    //1.loop to the table data
    //2.insert dummy native ad data to the desired index
    /*
     Post 1, Post 2, nativead [2]
     Post 3, Post 4, Post 5, nativead [6]
     Post 6, Post 7, Post 8, nativead [10]
     */
    if (APP_DELEGATE.arrHomeFeed) {
        int nextIndex = 2;
        AdNetworksType type = kBoomAds;
        for (int i = 0; i < APP_DELEGATE.arrHomeFeed.count; i++) {
            if (i == nextIndex) {
                
                NSDictionary* dictData = [[NSDictionary alloc] initWithDictionary:[APP_DELEGATE.arrHomeFeed objectAtIndex:i]];
                
                int IsAdvertisement = [[dictData valueForKey:@"IsAdvertisement"] intValue];
                if (IsAdvertisement == 0) {
                    [self insertMediatedNativeAd:i type:type];
                    
                    //alternate the native ads to show
                    if (type == kBoomAds) {
                        type = kFacebook;
                    }
                    else if (type == kFacebook) {
                        type = kBoomAds;
                    }
                   
                }
                
                nextIndex += 6;
            }
        }
        
      ....
    }
}

- (void)insertMediatedNativeAd:(NSInteger)index type:(AdNetworksType)type
{
    @try {
        NSMutableDictionary* emptyPost1 = [[NSMutableDictionary alloc] init];
        [emptyPost1 setObject:[NSNumber numberWithInt:1] forKey:@"IsAdvertisement"];
        [emptyPost1 setObject:@"" forKey:@"ProductID"];
        [emptyPost1 setObject:@"1" forKey:@"PostType"];
        [emptyPost1 setObject:[NSNumber numberWithInteger:type] forKey:kKeyNativeAdType];
        [APP_DELEGATE.arrHomeFeed insertObject:emptyPost1 atIndex:index];

        APP_DELEGATE.RecordCountHome++;
    } @catch (NSException* e) {
        NSLog(@"Something went wrong whie inserting mediated native ad.");
    }
}

- (void)onNativeAdReady:(NSDictionary*)data
{
    AdNetworksType type = [[data valueForKey:kKeyNativeAdType] integerValue];
    if (type == kTeads) {
        isTeadsLoading = false;
    }
    if (type==kFacebook) {
        isFBNativeOkToLoad=YES;
    }
}

- (void)onAdFail:(AdInfo)info errorInfo:(AdFailErrorInfo)errorInfo
{
    if (info.networkType == kTeads) {
        isTeadsLoading = false;
    }
    if (info.type==Native) {
        isBoomNativeOkToLoad=YES;
        boomNativeRetryCounter++;
        if (info.networkType==kFacebook) {
            isFBNativeOkToLoad=YES;
            boomFBNativeRetryCounter++;
        }
    }
}

