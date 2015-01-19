//
//  ViewController.m
//  GameDemoApp
//
//  Created by Rahul on 19/01/15.
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
    self.boomGuid = @"ca92b245-7951-43f3-b76d-ab10f9ade5c3";
    self.resourceManager = [BMResourceManager sharedInstance];
    self.resourceManager.videoTrackerInfoDelegate = self;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

- (IBAction)rewardButtonPressed:(id)sender {
    [BMResourceManager showVideoForGUID:self.boomGuid withType:BMReward];
}

- (IBAction)offerListButtonPressed:(id)sender {
    [BMResourceManager showVideoForGUID:self.boomGuid withType:BMOfferList];
}

- (IBAction)preRollButtonPressed:(id)sender {
    [BMResourceManager showVideoForGUID:self.boomGuid withType:BMPreroll];
}

- (void)boomVideoTrackCallbackWithEvent:(BOOMEventErrorCode)eventCode withData:(NSDictionary *)detailData {
    NSLog(@"BOOM TRACKING-----> %@",detailData);
}

@end
