//
//  BoomMediationAdDelegate.h
//  BoomVideoVAST_SDKLibrary
//
//  Created by Algene Pulido on 11/19/15.
//  Copyright © 2015 BM. All rights reserved.
//

/**
 
 Common ad networks delegate methods.
 Created to simplify things when using
 mediation system of this sdk
 
 */

#import <Foundation/Foundation.h>
#import "MediationConstants.h"

typedef NS_ENUM(NSInteger,AdType) {
    Interstitial=1,
    Incentivized,
    MoreList,
    Banner,
    Native,
    Unknown
};

typedef struct AdInfo {
    AdType type;
    AdNetworksType networkType;
} AdInfo;


@protocol BoomMediationAdDelegate <NSObject>

#pragma mark - REQUIRED
/**
 @brief called when ad is ready to be shown/or when an ad is loaded
 */
- (void) onAdReady;

/**
 @brief called when ad is already presented on screen
 */
- (void) onAdShow;

/**
 @brief called the moment before the ad is shown. This is the best place to pause any background music or any other else before showing the ad.
 */
- (void) onAdWillShow;

/**
 @brief called when ad is not ready to be shown/or when ad failed to load/or ad failed to show
 */
- (void) onAdFail:(AdInfo) info;


/**
 Ad was clicked/tapped
 */
- (void) onAdClick;

/**
 Ad was closed
 */
- (void) onAdClose;


#pragma mark - OPTIONAL
@optional
/**
 @brief Called when there is an Ad Reward
 @param data-contains information about the reward: obtain the values using the keys-keyValue for the value of the reward usually it is Integer type.
 */
- (void) onAdReward:(NSDictionary *) data;

/**
 @brief called when native ad data is ready/loaded. \n
 Check which ad network has native ad data using the key - (kKeyNativeAdType)
 */
- (void) onNativeAdReady:(NSDictionary *) data;

@end
