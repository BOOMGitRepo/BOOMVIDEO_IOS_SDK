//
//  BMNativeAdProperties.h
//  BoomVideoVAST_SDKLibrary
//
//  Created by Algene Pulido on 25/03/2016.
//  Copyright © 2016 BM. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Mediation/BoomMediationAdDelegate.h"

typedef NS_ENUM(NSInteger,ShowType) {
    Normal,
    Cover
};

/**
 Properties for the Native Ad.
 */
@interface BMNativeAdProperties : NSObject

/**
 @brief set/get the GUID
 */
@property (nonatomic,copy) NSString * _Nonnull GUID;
/**
 @brief set/get the showType.
 */
@property (nonatomic) ShowType showType;
/**
 @brief display the title and description view. This is not applicable on the comment page. If set to NO, the thumbnail image will occupy the entire native ad unit view. (Default YES)
 */
@property (nonatomic) BOOL displayInformation;

/**
 the delegate method
 */
@property (nonatomic,weak) id<BoomMediationAdDelegate> delegate;


@end
