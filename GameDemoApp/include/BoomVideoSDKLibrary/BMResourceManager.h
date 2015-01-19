//
//  BMResourceManager.h
//  Boom
//
//  Created by Boom on 29/09/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//




#import <Foundation/Foundation.h>
#import "BMBusinessRuleExecuter.h"
#import "BMVideoData.h"
#import "BusinessRuleExecuterDelegate.h"
#import "BoomVideoTrackerDelegate.h"
#import "AnalyticsTrackingDelegate.h"

@class BMBusinessRuleRequestResponseHandler;
@class BMBusinessRuleExecuter;

typedef enum {
    BMPreroll = 0,
    BMReward = 1,
    BMOfferList = 2
} BMFunctionType;

@interface BMResourceManager : NSObject <AnalyticsTrackingDelegate>

+(BMResourceManager *) sharedInstance;
+(void)showVideoForGUID:(NSString*)boomGuid withType:(BMFunctionType)type ;
- (void)createVPIDWithID:(NSString*)boomID;

- (void)forwardDataToBusinessExecuter:(NSArray*)dataArray withBoomGuid:(NSString*)boomGuid;
- (void)giveMessageToBusinessRuleExecuterForOfferListwithBoomGuid:(NSString*)boomGuid;
- (void)stopIndicator;

@property (nonatomic, assign) id<BusinessRuleExecuterDelegate> businessRuleExecuterDelegate;
@property (nonatomic, assign) id<BoomVideoTrackerDelegate> videoTrackerInfoDelegate;
@property (nonatomic, strong) BMBusinessRuleRequestResponseHandler *bmBusinessRuleHandler;
@property (nonatomic, strong) BMBusinessRuleExecuter *businessRuleExecuter;
@property (nonatomic, strong) BMVideoData *videoData;
@property (nonatomic, copy) NSString *vpid;
@property (nonatomic, copy) NSString *boomGuid;
@property (nonatomic, assign) int type;
@property (nonatomic, strong) NSArray *responseArray;
@property (nonatomic, strong) NSString *videoPercentCompletion;
@property (nonatomic, copy) NSString *points;

@property (nonatomic, strong) UIActivityIndicatorView *indicator;
@property (nonatomic, strong) UIViewController *activeViewController;
@property (nonatomic, strong) UIView *indicatorView;

@end
