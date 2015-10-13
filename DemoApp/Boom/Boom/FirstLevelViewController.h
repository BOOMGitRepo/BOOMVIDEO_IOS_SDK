//
//  FirstLevelViewController.h
//  Boom
//
//  Created by Boom on 25/02/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BMResourceManager.h"

@interface FirstLevelViewController : UIViewController <BoomVideoTrackerDelegate>
@property (nonatomic, copy) NSString *boomGuid;
@end
