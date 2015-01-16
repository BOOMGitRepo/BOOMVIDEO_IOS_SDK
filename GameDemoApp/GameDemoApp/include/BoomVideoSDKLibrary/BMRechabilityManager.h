//
//  BMRechabilityManager.h
//
//
//  
//  Copyright (c) 2014 Cybage. All rights reserved.
//
typedef void(^networkAvailableBlock)(int network);
#import <Foundation/Foundation.h>
/*! RechabilityStatus enum has the network status
    Each network conditions has his own value.
 */
typedef NS_ENUM(NSInteger, RechabilityStatus) {
    kHostNotRechable    = -1,
    kNoRechability      = 0,
    kWiFiRechability    = 1,
    kCellularRechability= 2
};

@interface BMRechabilityManager : NSObject
+ (BMRechabilityManager*)sharedInstance;
- (void) isNetworkAvailable;
@property (strong, nonatomic) networkAvailableBlock availabiltyBlock;

//@property (nonatomic, assign) id<ReachabilityDelegate> reachabilityDelegate;
@end
