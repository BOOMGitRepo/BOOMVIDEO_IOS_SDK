//
//  SecondViewController.m
//  GameDemoApp
//
//  Created by Boom on 06/04/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import "SecondViewController.h"
#import "BMResourceManager.h"
@interface SecondViewController ()

@property (nonatomic, strong) BMResourceManager *resourceManager;

@end

@implementation SecondViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *boomGuid = @"ff0033eb-481e-4da3-8d54-0ac3f9e5e66f";   //Demo BoomGUID
    self.resourceManager = [BMResourceManager sharedInstance];
    [self.view addSubview:[self.resourceManager showBannerForGUID:boomGuid withFrame:CGRectMake(0, 80, self.view.frame.size.width, 100) onTarget:self]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)backButtonPressed:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
