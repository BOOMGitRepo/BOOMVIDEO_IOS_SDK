//
//  SecondLevelViewController.m
//  Boom
//
//  Created by Boom on 25/02/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import "SecondLevelViewController.h"
#import <JavaScriptCore/JavaScriptCore.h>

@interface SecondLevelViewController ()

@property (strong, nonatomic) IBOutlet UIButton *homeButton;
@property (strong, nonatomic) UILabel *label1;
- (IBAction)homeButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;

@property (nonatomic, copy) NSString *boomGuid;

@end

@implementation SecondLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)viewDidAppear:(BOOL)animated {
    [self animateView];
}

- (void)animateView {
    
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, [self fetchHeight]/2 - 120, [self fetchWidth], 50)];
    [self.label1 setText:@"SECOND LEVEL OF GAME UNLOCKED"];
    [self.label1 setTextColor:[UIColor whiteColor]];
    self.label1.textAlignment = NSTextAlignmentCenter;
    [self.label1 setFont:[UIFont fontWithName:@"Arial-BoldMT" size:30]];
    [self.view addSubview:self.label1];
    [UIView animateWithDuration:8.0f
                          delay:0.0f
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [self.label1 setFrame:CGRectMake(0.0f, [self fetchHeight]/2 + 70, [self fetchWidth], 50)];
                     }
                     completion:nil];
    [self.view bringSubviewToFront:self.label1];
    
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskLandscape;
}

- (float)fetchHeight {
    if (self.view.frame.size.height < self.view.frame.size.width) {
        return self.view.frame.size.height;
    } else {
        return self.view.frame.size.width;
    }
}

- (float)fetchWidth {
    if (self.view.frame.size.height > self.view.frame.size.width) {
        return self.view.frame.size.height;
    } else {
        return self.view.frame.size.width;
    }
}

- (IBAction)homeButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
