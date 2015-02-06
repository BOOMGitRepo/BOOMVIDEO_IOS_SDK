//
//  BMAnalyticsRequestResponseHandler.h
//  Boom
//
//  Created by Boom on 11/11/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import "BMResponseRequestBaseHandler.h"
#import "BMConstant.h"

@interface BMAnalyticsRequestResponseHandler : BMResponseRequestBaseHandler

-(void)createAnalyticsRequestWithURL:(NSString *)analyticsUrl withID:(NSString*)boomGuid withParameterId:(NSString *)parameterId ;

@end
