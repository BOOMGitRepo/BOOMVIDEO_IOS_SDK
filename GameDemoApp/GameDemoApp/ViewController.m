//
//  ViewController.m
//  GameDemoApp
//
//  Created by Boom on 19/01/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

- (IBAction)preRollButtonPressed:(id)sender;
- (IBAction)rewardButtonPressed:(id)sender;
- (IBAction)offerListButtonPressed:(id)sender;

@property (nonatomic, copy) NSString *boomGuid;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.boomGuid = @"9c6543a6-a41e-4657-9178-84210b22d794";    //Demo boomGUID
    [BMResourceManager sharedInstance].videoTrackerInfoDelegate = self;
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskLandscape;
}*/

- (IBAction)rewardButtonPressed:(id)sender {
    [[BMResourceManager sharedInstance] showVideoForGUID:self.boomGuid withType:BMReward];
}

- (IBAction)offerListButtonPressed:(id)sender {
    [[BMResourceManager sharedInstance] showVideoForGUID:self.boomGuid withType:BMOfferList];
}

- (IBAction)preRollButtonPressed:(id)sender {
    [[BMResourceManager sharedInstance] showVideoForGUID:self.boomGuid withType:BMPreroll];
}

- (void)boomVideoTrackCallbackWithEvent:(BOOMEventErrorCode)eventCode withData:(NSDictionary *)detailData {
    NSLog(@"BOOM TRACKING-----> %@",detailData);
}

@end
