//
//  BMResponseRequestBaseHandler.h
//  Boom
//
//  Created by Boom on 30/09/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMNetworkManager.h"

typedef void (^onParseComplete) (NSArray *responseArray, NSDictionary *metaDeta, NSError* error);

@interface BMResponseRequestBaseHandler : NSObject
@property (nonatomic, copy)   onParseComplete         onParseCompletion;
@property (nonatomic, strong)   BMNetworkManager        *connectionManager;

- (void)parseResponse:(NSData*)data;
@end
