//
//  BMNetworkManager.h
//  Boom
//
//  Created by Boom on 30/09/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMConstant.h"

#define SUCCESS_CODE 200
#define REQUEST_TIMEOUT -1001

typedef void (^onOperationComplete) (NSData *responseData, NSError* error);

@interface BMNetworkManager : NSObject
@property (nonatomic, copy) onOperationComplete onDownloadCompletion;
@property (nonatomic, copy) onOperationComplete onVpidCreation;

- (void)initWithRequest:(NSURLRequest*)request withRequestTpe:(NSString *)requestType;


@end
