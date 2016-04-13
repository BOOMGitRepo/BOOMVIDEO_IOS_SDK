//
//  AdNetworksManager.h
//  BoomVideoVAST_SDKLibrary
//
//  Created by Algene Pulido on 11/16/15.
//  Copyright © 2015 BM. All rights reserved.
//
/**
 <p><strong>Millennial Media, Rubicon and MoPub is under development.</strong></p>
 <h1>How To Setup:<h1>
 1. Download Boom SDK and the include folder then include it in your project. For IOS (libBoom***.a and the BoomResources.bundle).
 2. Download and include in your project the necessary sdk's either (.framework, .a) of the ad networks you wish to include in mediation. Please check the documentation of each ad network.
 3. Setup the necessary credentials of each ad network you wish to include like chartboost, ad colony, etc..
 4. FOR IOS:
    Initialize mediation with auto fetch of credentials from server using <code>initMediationFetchCredentialsWithToken:(NSString *) token GUID:(NSString*) guid isLogging:(BOOL) enabled;</code>
    token and guid will be provided by boom.
    <p>You may also initialize mediation with manual input of credentials using</p>
    <code>initMediationWithCredentials:(NSDictionary*) credentials isLogging:(BOOL) enabled;</code>
    <p>Now you can use other methods after initialization. Refer below.</p>
 
 <br>
 
 <h2>Show Mediated Interstitial Ads</h2>
 <p>To show mediated interstitial ads, use the method</p>
 <code>[[AdNetworksManager sharedInstance] showMediatedInterstitialAds];</code>
 
 <h2>Show Mediated Incentivized Ads</h2>
 <p>To show mediated incentivized(rewarded) ads, use the method</p>
 <code>[[AdNetworksManager sharedInstance] showMediatedIncentivizedAds];</code>
 
 <h2>Show Mediated More List Ads (More Apps, Offer List)</h2>
 <p>To show mediated more list ads, use the method</p>
 <code>[[AdNetworksManager sharedInstance] showMediatedMoreList];</code>
 
 <h2>Show Mediated Banner Ads (AdMob only)</h2>
 <p>To show mediated banner ads, use the method (we only have admob banner ads at the moment)</p>
 <code>[[AdNetworksManager sharedInstance] showMediatedBannerAdsWithSize:kBoomGADAdSizeBanner Position:kBannerBottomCenter adUnitId:@"YOUR_AD_UNIT_ID"];
 </code>
 <p>Different banner ad sizes:</p>
 <ul>
    <li>kBoomGADAdSizeBanner</li>
    <li>kBoomGADAdSizeLargeBanner</li>
    <li>kBoomGADAdSizeMediumRectangle</li>
    <li>kBoomGADAdSizeFullBanner</li>
    <li>kBoomGADAdSizeLeaderboard</li>
    <li>kBoomGADAdSizeSkyscraper</li>
 </ul>
 <p>Different banner ad positions:</p>
 <ul>
    <li>kBannerTopLeft</li>
    <li>kBannerTopCenter</li>
    <li>kBannerTopRight</li>
    <li>kBannerBottomLeft</li>
    <li>kBannerBottomCenter</li>
    <li>kBannerBottomRight</li>
 </ul>
 <p><strong>Banner ads automatically adjust when orientation changes.</strong></p>
 
 <br>
 <h2>For Manual Input of Credentials</h2>
 <p>If you wish to input the credentials manually through code, here is an example.</p>
 <code>
 NSMutableDictionary *credentials=[[NSMutableDictionary alloc] init];
 <br>[credentials setValue:@"your adcolony app id" forKey:@kKeyAdColonyAppId];
 <br>[credentials setValue:@"your adcolony interstitial zone id" forKey:@kKeyAdColonyInterstitialZoneId];
 <br>[credentials setValue:@"your adcolony v4vc zone id (incentivized ad)" forKey:@kKeyAdColonyV4VCZoneId];
 <br>
 <br>[[AdNetworksManager sharedInstance] initMediationWithCredentials:credentials isLogging:YES];
 
 </code>
 <p>Please refer to <i>MediationConstants.h</i> for the different keys of different ad networks.</p>
 <br>
 <h1>Very Important! Please add -ObjC in your xcode project Other Linker Flags</h1>
 <h2>Please contact support if you have problems. Thanks!</h2>
*/

#ifndef AdNetworksManager_h
#define AdNetworksManager_h
#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "MediationConstants.h"
#import "../BMNativeAdProperties.h"

/**
 Banner ad properties for the ad networks that has banner ad. At the moment we have facebook, admob, and rubicon.
 */
@interface BMBannerAdProperties : NSObject

@property (nonatomic) BoomGADBannerSize AdMobBannerSize;
@property (nonatomic) FBBannerAdSize FBBannerSize;
@property (nonatomic) CGSize RubiconBannerSize;
@property (nonatomic) BoomBannerAdPosition BannerPosition;

@end

@interface AdNetworksManager : NSObject <BoomMediationAdDelegate>

@property (nonatomic,weak) id <BoomMediationAdDelegate> delegate;

/**
 @brief singleton instance
 */
+ (AdNetworksManager*) sharedInstance;

/**
 @brief initialize mediation with credentials. Logging is disabled by default.
 */
- (void) initMediationWithCredentials:(NSDictionary*) credentials;

/**
 @brief initialize mediation with credentials
 @param isLogging - enable/disable debug log messages
 */
- (void) initMediationWithCredentials:(NSDictionary*) credentials isLogging:(BOOL) enabled;

/**
 @brief initialize mediation with credentials in JSON format
 @param jsonString - the json string of the credentials. e.g. "{\\"yourkey\\":\\"yourvalue\\"}" \\" is important.
 */
- (void) initMediationWithJSON:(const char*) jsonString;

/**
 @brief initialize mediation with auto fetch credentials from server
 @param token token id given by boom
 @param guid guid given by boom
 @param isLogging set logging enable/disable
 */
- (void) initMediationFetchCredentialsWithToken:(NSString *) token GUID:(NSString*) guid isLogging:(BOOL) enabled;

/**
 @brief initialize mediaton with auto fetch credentials from server. Logging is disabled by default.
 @param token token id given by boom
 @param guid guid given by boom
 */
- (void) initMediationFetchCredentialsWithToken:(NSString *) token GUID:(NSString*) guid ;

#pragma mark - SHOW MEDIATED ADS METHODS
/**
 @brief alternately shows the available mediated ad networks
 */
- (void) showMediatedInterstitialAds;

/**
 @brief show more ads lists like offer list or more apps list
 */
- (void) showMediatedMoreList;

/**
 @brief alternately show the available mediated ad networks rewarded/incentive ads
 */
- (void) showMediatedIncentivizedAds;

/**
 @brief show ad mob banner ad
 @param properties the different banner properties to set (size and position)
 */
- (void) showMediatedBannerAdsWithProperties:(BMBannerAdProperties *) properties;

/**
 @brief remove the banner from screen
 */
- (void) removeBanner;

/**
 @brief shows mediated native ads
 @param properties only used for Boom Native Ads. (This can be nil)
 */
- (void) showMediatedNativeAds:(BMNativeAdProperties * _Nullable) properties;

/**
 @brief shows the mediation test ui screen for debugging individual ad network
 */
- (void) showMediationTest;

#pragma mark - SHOW SPECIFIC AD METHODS
/**
 @brief shows interstitial ad for the given ad type
 @param type the ad network type
 */
- (BOOL) showInterstitialForAdType:(AdNetworksType) type;

/**
 @brief shows incentivized ad for the given ad type
 @param type the ad network type
 */
- (BOOL) showIncentivizedForAdType:(AdNetworksType) type;

/**
 @brief shows more list/offer list/more apps ad for the given ad type
 @param type the ad network type
 */
- (BOOL) showMoreListForAdType:(AdNetworksType) type;

/**
 @brief shows banner ad for ad type.
 @param type the ad network type.
 @param properties the different banner properties to set
 */
- (BOOL) showBannerForAdType:(AdNetworksType) type Properties:(BMBannerAdProperties *) properties;

- (void) loadNativeAdForAdType:(AdNetworksType) type Properties:(BMNativeAdProperties*) properties;

- (void) setCurrentViewController:(UIViewController*) viewController;

@end

#endif /* AdNetworksManager_h */
