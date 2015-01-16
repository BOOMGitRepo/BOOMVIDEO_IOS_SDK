//
//  BMBusinessRuleExecuterViewController.h
//  Boom
//
//  Created by Boom on 01/10/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//



#import <UIKit/UIKit.h>
#import "BMResourceManager.h"
#import "BMBasePlayerViewController.h"
#import "BMSocialSharingManager.h"
#import "BMAnalyticsRequestResponseHandler.h"
#import "BusinessRuleExecuterDelegate.h"
#import "AnalyticsTrackingDelegate.h"

@class BMSocialSharingManager;
@class BMBasePlayerViewController;

@interface BMBusinessRuleExecuter : NSObject <BusinessRuleExecuterDelegate>

@property (nonatomic,strong) BMBasePlayerViewController *basePlayerController;
@property (nonatomic,strong) BMSocialSharingManager *socialSharingManager;
@property (nonatomic,assign) id<AnalyticsTrackingDelegate> analyticsDelegate;
@property (nonatomic, strong) BMAnalyticsRequestResponseHandler *analyticsResponseHandler;
@property (nonatomic, strong) BMResourceManager *resourceManager;

- (void)executeBusinessRuleForUI:(NSArray*)array;

- (void)shareOnFaceBook:(NSString *)linkString;
- (void)shareOnTwitter:(NSString *)linkString;
- (void)shareOnGooglePlus:(NSString *)linkString;

- (void)analyticsUrl:(NSString *)analyticsUrl withStatus:(NSString *)parameter withCallBack:(BOOL)callBack;
- (void)analyticsDelegateCallBack:(NSString *)parameter;

@end
