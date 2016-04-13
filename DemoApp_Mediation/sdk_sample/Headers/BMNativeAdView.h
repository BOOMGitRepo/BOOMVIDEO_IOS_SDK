//
//  BMNativeAdView.h
//  BoomVideoVAST_SDKLibrary
//
//  Created by Algene Pulido on 1/28/16.
//  Copyright © 2016 BM. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "BMNativeAdData.h"

@interface BMNativeAdView : UIView

/**
 @brief this block will be called when data has been fetched already from server. You can add codes here to customize the appearance of the native ad, etc..
 @param data will contain the native ad data. However, vast data like vast icon, vast video link and comments data will not be available.
 */
@property (nonatomic,copy) void (^onDataFetched)(BMNativeAdData  * _Nonnull data);

/**
 @deprecated
 */
- (void) handleOutOfScreen:(UIView *) scrollView __deprecated_msg("Use handleOutOfScreenForTableView");
/**
 @brief This is a new way of detecting when the native ad view is visible on a table view. Use this when using table view for a native ad. Add this method in your scrollViewDidEndDecelerating.
 */
- (void) handleOutOfScreenForTableView:(UITableView *) tableView indexPath:(NSIndexPath *) indexPath;
/**
 @brief used when native ad view was tapped on a UITableViewCell or other containers
 */
- (void) handleOnTap;


/**
 @brief customize the description font.
 */
- (void) setDescriptionFont:(UIFont*) font;
/**
 @brief customize the description frame.
 */
- (void) setDescriptionFrame:(CGRect) frame;
/**
 @brief customize the title font.
 */
- (void) setTitleFont:(UIFont*) font;
/**
 @brief customize the title frame.
 */
- (void) setTitleFrame:(CGRect) frame;

/**
 @brief customize the sponsor icon frame
 */
- (void) setSponsorIconFrame:(CGRect) frame;

/**
 @brief customize the sponsor title frame
 */
- (void) setSponsorTitleFrame:(CGRect) frame;

/**
 @brief customize the "Sponsored" text frame
 */
- (void) setSponsoredTextFrame:(CGRect) frame;

/**
 @brief customize the media (thumbnail image or video) container frame
 */
- (void) setMediaContainerFrame:(CGRect) frame;

/**
 @brief customize the sponsor title font
 */
- (void) setSponsorTitleFont:(UIFont*) font;
/**
 @brief customize the "Sponsored" text font
 */
- (void) setSponsoredTextFont:(UIFont*) font;


/**
 @brief pauses the video player if VideoCampaign. You may use this to force the video player to pause when you wan't to present another view controller.
 */
- (void) pauseVideoPlayer;
/**
 @brief resumes the video player if VideoCampaign
 */
- (void) resumeVideoPlayer;


/**
@brief returns the native ad unit sponsor icon data
 */
- (NSData*) getSponsorIconData;
/**
 @brief returns the native ad unit title
 */
- (NSString *) getNativeAdTitle;
/**
 @brief returns the native ad unit description
 */
- (NSString *) getNativeAdDescription;
/**
 @brief returns the native ad unit thumbnail image.
 */
- (UIImage*) getThumbnailImage;

@end

