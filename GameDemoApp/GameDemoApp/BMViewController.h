//
//  BMViewController.h
//  Boom
//
//  Created by Sachin Patil on 29/09/14.
//  Copyright (c) 2014 Sachin Patil. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>
#import "BMResourceManager.h"

@interface BMViewController : UIViewController <BoomVideoTrackerDelegate>

@property (nonatomic, strong) BMResourceManager *resourceManager;

@end
