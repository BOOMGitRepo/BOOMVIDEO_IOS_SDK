//
//  ViewController.m
//
//  Created by Boom
//  Copyright (c) 2016 Boom. All rights reserved.
//  Below code are just Example Code for Integration, please add your customized code when integraed
//  Follow the document to add Integration Code
//
- (void)viewWillAppear:(BOOL)animated
{
    [[AdNetworksManager sharedInstance] setDelegate:self];
   
    if (self.isShowAdvertiesment) {

        if (!isShowAdds) {

            [self preRollButtonPressed:nil];
        }
		.....
    }
    else {

        [self prepareForPlay];
    }

    [super viewWillAppear:animated];
}



- (IBAction)preRollButtonPressed:(id)sender
{
	/////Display Ads
    [[AdNetworksManager sharedInstance] showInterstitialForAdType:kBoomAds];
}


- (void)onAdShow:(AdInfo)info
{
    NSLog(@"Ads display");
}

- (void)onAdClose:(AdInfo)info
{
    [self performSelectorOnMainThread:@selector(prepareForPlay) withObject:nil waitUntilDone:YES];
}

- (void)showFBInterstitial
{
    [[AdNetworksManager sharedInstance] showInterstitialForAdType:kFacebook];
}
- (void)onAdFail:(AdInfo)info errorInfo:(AdFailErrorInfo)errorInfo
{

    if (info.networkType == kBoomAds) {
        [self performSelectorOnMainThread:@selector(showFBInterstitial) withObject:nil waitUntilDone:YES];
    }
    else if (info.networkType == kFacebook) {
        [self performSelectorOnMainThread:@selector(prepareForPlay) withObject:nil waitUntilDone:YES];
    }
    if (errorInfo.errorInfo == NOFILL) {
        NSLog(@"No Ads");
    }
    else if (errorInfo.errorInfo == NETWORK_ERROR) {
        NSLog(@"Network/Internet error");
    }
    else if (errorInfo.errorInfo == CREDENTIALS_ERROR) {
        NSLog(@"CREDENTIALS error");
    }
    else {
        NSLog(@"Other error");
    }
}

