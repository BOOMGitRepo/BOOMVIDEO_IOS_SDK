//
//  MediationConstants.h
//  BoomVideoVAST_SDKLibrary
//
//  Created by Algene Pulido on 11/19/15.
//  Copyright © 2015 BM. All rights reserved.
//

#ifndef MediationConstants_h
#define MediationConstants_h

//for credential configuration of different ad networks

//main ad network boom
#define kKeyBoomGUID                    @"boomguid"

//ad colony
#define kKeyAdColonyAppId               @"adcolonyappid"
#define kKeyAdColonyInterstitialZoneId  @"adcolonyinterstitialzoneid"
#define kKeyAdColonyV4VCZoneId          @"adcolonyv4vczoneid"
#define kKeyAdColonyAPIKey              @"adcolonyApiKey"

//admob
#define kKeyAdMobAdUnitId               @"admobadunitid"
#define kKeyAdMobBannerAdUnitId         @"admobbanneradunitid"
#define kKeyAdMobNativeAdUnitId         @"admobnativeadunitid"
#define kKeyAdMobStaticUnitId           @"admobstaticunitid"
#define kKeyAdMobVideoUnitId            @"admobvideounitid"

//applovin
//credential for applovin is at info.plist or the app plist file

//chartboost
#define kKeyChartboostAppId             @"cbappid"
#define kKeyChartboostAppSig            @"cbappsignature"

//unityads
#define kKeyUnityAdsGameId              @"unitygameid"
#define kKeyUnityAdsNonRewardedZone     @"unityadsnonrewardedzone"
#define kKeyUnityAdsRewardedZone        @"unityadsrewardedzone"

//vungleads app id
#define kKeyVungleAppId                 @"vungleappid"

//mopub
#define kKeyMoPubInterstitialAdUnitId   @"mopubInterstitialAdUnitId"
#define kKeyMoPubRewardedVideoAdUnitId  @"mopubRewardedVideoAdUnitId"
#define kKeyMoPubBannerAdUnitId         @"mopubBannerAdUnitId"

//rubicon
#define kKeyRubiconInterstitialServer   @"rubiconInterstitialServer"
#define kKeyRubiconInterstitialAppId    @"rubiconInterstitialAppId"
#define kKeyRubiconInterstitialPubId    @"rubiconInterstitialPubId"
#define kKeyRubiconInterstitialAccId    @"rubiconInterstitialAccId"

//millennial media
#define kKeyMMInterstitialId            @"MMInterstitialId"
#define kKeyMMBannerId                  @"MMBannerId"

//facebook audience network (PID-Placement ID)
#define kKeyFBInterstitialAdPID           @"keyFBInterstitialPID"
#define kKeyFBNativeAdPID                 @"keyFBNativePID"
#define kKeyFBBannerAdPID                 @"keyFBBannerPID"

//boom mediation ad delegate keys
//for ad reward
//for most of the ad networks
#define kKeyAdRewardValue               @"keyValue"
//for unity ads reward
#define kKeyAdRewardUnityAdsRewardKey   @"keyUnityAdsRewardKey"

#pragma mark - NATIVE AD KEY CONSTANTS
//Dictionary Keys for a native ad type

//used to know which native ad type is loaded/fetched and ready in onNativeAdReady delegate method
#define kKeyNativeAdType                  @"nativeAdType"

#pragma mark - FACEBOOK NATIVE AD keys
//facebook audience network native ad
//dictionary keys for native ad
#define kKeyFBTitle                       @"title"
#define kKeyFBSubtitle                    @"subtitle"
#define kKeyFBBody                        @"body"
#define kKeyFBSocialContext               @"socialContext"
#define kKeyFBCallToAction                @"callToAction"
#define kKeyFBIcon                        @"icon"
#define kKeyFBCoverImage                  @"coverImage"

#pragma mark - BOOM NATIVE ADS
#define kKeyBMNativeAdData                @"keyBMNativeAdData"
#define kKeyBMNativeAdView                @"keyBMNativeAdView"

typedef NS_ENUM(NSInteger,AdNetworksType) {
    kAdColony=1,
    kAdMob,
    kAppLovin,
    kBoomAds,
    kChartboost,
    kUnityAds,
    kVungleAds,
    kMoPub,
    kRubicon,
    kMillennialMedia,
    /**
     @brief Facebook Audience Network
     */
    kFacebook
};

typedef NS_ENUM(NSInteger,BoomBannerAdPosition) {
    kBannerTopLeft=1,
    kBannerTopCenter,
    kBannerTopRight,
    kBannerBottomLeft,
    kBannerBottomCenter,
    kBannerBottomRight
};

typedef NS_ENUM(NSInteger,FBBannerAdSize) {
    Height50=1,
    Height90,
    Height250
};

/*
typedef struct BoomFBAdSize {
    CGSize size;
} BoomFBAdSize;*/

typedef NS_ENUM(NSUInteger, BoomGADBannerSize) {
    kBoomGADAdSizeBanner=1,
    kBoomGADAdSizeLargeBanner,
    kBoomGADAdSizeMediumRectangle,
    kBoomGADAdSizeFullBanner,
    kBoomGADAdSizeLeaderboard,
    kBoomGADAdSizeSkyscraper
    //kBoomGADAdSizeSmartBannerPortrait,
    //kBoomGADAdSizeSmartBannerLandscape,
    //kBoomGADAdSizeFluid
};

typedef NS_ENUM(NSInteger,NADestination) {
    Signup=1,
    Purchase,
    Install,
    Survey,
    SlideShare,
    Blog,
    Website,
    Instagram,
    Mraid,
    SocialShare,
    Photo,
    None
    //Photo is not been added yet currently. For tvos campaign, Blog, SlideShare, Mraid and Website will not be assigned.
};

#endif /* MediationConstants_h */
