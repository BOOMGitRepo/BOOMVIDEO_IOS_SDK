//
//  ViewController.h
//  GameDemoApp
//
//  Created by Boom on 19/01/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMResourceManager.h"

@interface ViewController : UIViewController <BoomVideoTrackerDelegate>

@property (nonatomic, strong) BMResourceManager *resourceManager;

@end

