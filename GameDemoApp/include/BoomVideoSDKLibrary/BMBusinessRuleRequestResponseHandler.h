//
//  BMBusinessRuleHandler.h
//  Boom
//
//  Created by Boom on 30/09/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BMResponseRequestBaseHandler.h"

@interface BMBusinessRuleRequestResponseHandler : BMResponseRequestBaseHandler
-(void)createRequestWithID:(NSString*)boomGuid withType:(int)type;
-(void)createRequestForVpidWithID:(NSString*)boomGuid;
@end
