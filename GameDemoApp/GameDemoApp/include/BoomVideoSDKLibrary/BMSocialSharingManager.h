//
//  BMSocialSharingManager.h
//  Boom
//
//  Created by Boom on 14/10/14.
//  Copyright (c) 2014 Boom. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Social/Social.h>
#import <GooglePlus/GooglePlus.h>
#import "BMResourceManager.h"
#import "BMBusinessRuleExecuter.h"

@interface BMSocialSharingManager : NSObject <GPPSignInDelegate, GPPShareDelegate>

@property (nonatomic, strong) UIViewController *activeViewController;
@property (nonatomic, strong) SLComposeViewController *composeController;
@property (nonatomic, strong) BMResourceManager *resourceManager;
@property (nonatomic, copy) NSString *link;

- (void)shareViaFacebook:(NSString *)linkString;
- (void)shareViaTwitter:(NSString *)linkString;
- (void)shareViaGooglePlus:(NSString *)linkString;

@end
