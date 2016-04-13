//
//  ViewController.m
//  sdk_sample
//
//  Created by Algene Pulido on 12/04/2016.
//  Copyright © 2016 Algene Pulido. All rights reserved.
//

#import "ViewController.h"
#import "Headers/Mediation/AdNetworksManager.h"
#import "BMResourceManager.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self initializeBoomAdCredentials];
    
    //if you need delegates
//    [AdNetworksManager sharedInstance].delegate=self;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)onBtnMediatedInterstitialClicked:(id)sender {
    [[AdNetworksManager sharedInstance] showMediatedInterstitialAds];
}

- (IBAction)onBtnMediatedIncentivizedClicked:(id)sender {
    [[AdNetworksManager sharedInstance] showMediatedIncentivizedAds];
}

- (IBAction)onBtnMediatedMorelistClicked:(id)sender {
    [[AdNetworksManager sharedInstance] showMediatedMoreList];
}

- (IBAction)onBtnMediatedBannerClicked:(id)sender {
    BMBannerAdProperties *properties=[[BMBannerAdProperties alloc] init];
    properties.BannerPosition=kBannerBottomCenter;
    properties.FBBannerSize=Height50;
    properties.AdMobBannerSize=kBoomGADAdSizeBanner;
    properties.RubiconBannerSize=CGSizeMake(320, 50);
    [[AdNetworksManager sharedInstance] showMediatedBannerAdsWithProperties: properties];
}

- (IBAction)onBtnShowANativeAdClicked:(id)sender {
    BMNativeAdProperties *properties=[[BMNativeAdProperties alloc] init];
    properties.displayInformation=YES;
    properties.GUID=@"";
    properties.showType=Normal;
//    properties.delegate=self;//if you need delegates
    
    //it's better to use the delegate method onNativeAdReady than the below code..
    BMNativeAdView *nativeAd=[[BMResourceManager sharedInstance] createNativeAdWithProperties:properties frame:CGRectMake(0, 250, 300, 350) parentView:self.view];
    [self.view addSubview:nativeAd];
    
    //for facebook native ad, it's required for you to implement the delegate method onNativeAdReady
}

- (IBAction)onBtnMediationTestClicked:(id)sender {
    [[AdNetworksManager sharedInstance] showMediationTest];
}

- (void) initializeBoomAdCredentials
{
    NSMutableDictionary *configuration=[[NSMutableDictionary alloc] init];
    
    //boom ads (main ad network)
    [configuration setValue:@"02184897-ed13-41b6-9b4e-5e056fa688ac" forKey:kKeyBoomGUID];
    
    //ad colony
    [configuration setValue:@"app6126a4f02d5a4042a8" forKey:kKeyAdColonyAppId];
    [configuration setValue:@"vz72cba0db59b84f5cb3" forKey:kKeyAdColonyInterstitialZoneId];
    [configuration setValue:@"vz24e55de2a21c4ae1be" forKey:kKeyAdColonyV4VCZoneId];
    
    //ad mob
    [configuration setValue:@"ca-app-pub-7599162474899119/9387594119" forKey:kKeyAdMobAdUnitId];
    [configuration setValue:@"ca-app-pub-7599162474899119/5922436915" forKey:kKeyAdMobBannerAdUnitId];
    
    
    //applovin
    //insert AppLovinSdkKey key in info.plist with your applovin sdk key
    
    //chartboost
    [configuration setValue:@"564e8d31346b520b11f5cbac" forKey:kKeyChartboostAppId];
    [configuration setValue:@"2d40334b6f767db776f4de835c7ad48f6a7322dd" forKey:kKeyChartboostAppSig];
    
    //unity ads
    [configuration setValue:@"89621" forKey:kKeyUnityAdsGameId];
    [configuration setValue:@"defaultZone" forKey:kKeyUnityAdsNonRewardedZone];
    [configuration setValue:@"rewardedVideoZone" forKey:kKeyUnityAdsRewardedZone];
    
    //vungle
    [configuration setValue:@"564fe66243d28eb34c00000b" forKey:kKeyVungleAppId];
    
    //rubicon
    [configuration setValue:@"http://mrp.rubiconproject" forKey:kKeyRubiconInterstitialServer];
    [configuration setValue:@"3DCDCD7032890131760312313B0EDD7D" forKey:kKeyRubiconInterstitialAppId];
    //account id and publisher id is the same
    [configuration setValue:@"111008" forKey:kKeyRubiconInterstitialAccId];
    [configuration setValue:@"111008" forKey:kKeyRubiconInterstitialPubId];
    
    //facebook
    //sunrise surfer - placement ids
    [[BMResourceManager sharedInstance] setFacebookAppId:@"687170864719574"];
    [configuration setValue:@"687170864719574_702096953226965" forKey:kKeyFBInterstitialAdPID];
    [configuration setValue:@"687170864719574_702097129893614" forKey:kKeyFBBannerAdPID];
    [configuration setValue:@"687170864719574_702097189893608" forKey:kKeyFBNativeAdPID];
    
    
    [[AdNetworksManager sharedInstance] initMediationWithCredentials:configuration isLogging:YES];
}

@end
