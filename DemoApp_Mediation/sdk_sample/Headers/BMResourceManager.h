//
//  BMResourceManager.h
//  Boom
//
//  Created by Boom on 29/09/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BoomVideoTrackerDelegate.h"
#import "BMNativeAdView.h"
#import "BMNativeAdProperties.h"
//#import "Mediation/BoomMediationAdDelegate.h"

#if TARGET_OS_TV
#import "Mediation/AdNetworks/BoomFacebookAudienceNetwork.h"
#import "Mediation/MediationConstants.h"
#endif

typedef NS_ENUM(NSInteger, BMFunctionType) {
    BMPreroll,
    BMReward,
    BMOfferList,
    BMNative,
    BMNone
};

@interface BMResourceManager : NSObject 

@property (nonatomic, assign) id<BoomVideoTrackerDelegate> videoTrackerInfoDelegate;

+(BMResourceManager *) sharedInstance;

- (void)showVideoForGUID:(NSString *)boomGuid withType:(BMFunctionType)type ;

/**
 @brief creates a native ad view
 @param boomGuid the guid from boom
 @param rect the frame size
 @param parentView the parent view of this native ad view where you added it as subview.
 */
- (BMNativeAdView*) createNativeAdForGUID:(NSString *)boomGuid frame:(CGRect) rect ShowAs:(ShowType) showType parentView:(UIView*) view __deprecated_msg("Use the method with BMNativeAdProperties");

/**
 creates a native ad view with set properties
 @param properties contains different properties for the native ad
 @param rect the frame size
 @param parentView the parent view of this native ad view where you added it as subview
 */
- (BMNativeAdView*) createNativeAdWithProperties:(BMNativeAdProperties *) properties frame:(CGRect) rect parentView:(UIView*) view;

/**
 @brief removes the native ad from screen.
 */
- (void) removeNativeAd:(UIView*) nativeAdView;

/**
 @brief sets the facebook app id to be used for using facebook social
 */
- (void) setFacebookAppId:(NSString*) appid;

/**
 @brief Facebook reset access token (for tvos) or log out the current user (for ios)
 @return YES if successful otherwise NO
 */
- (BOOL) resetFacebookUser;

/**
 at the moment, mediation system is not yet full for tv os. We separate it for the mean time.
 */
#if TARGET_OS_TV
- (void) showFBInterstitial:(NSString *) placementId;
- (void) showFBBanner:(NSString *) placementId size:(FBBannerAdSize)size Position:(BoomBannerAdPosition) position;
- (void) loadFBNativeAd:(NSString *) placementId;
- (void) initFacebook:(NSDictionary *) credentials;

#endif

@end
