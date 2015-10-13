//
//  FirstLevelViewController.m
//  Boom
//
//  Created by Boom on 25/02/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import "FirstLevelViewController.h"
#import "SecondLevelViewController.h"
#import <QuartzCore/QuartzCore.h>

@interface FirstLevelViewController ()
- (IBAction)secondLevelButton:(id)sender;
@property (strong, nonatomic) IBOutlet UIImageView *backgroundImage;
- (IBAction)backButton:(id)sender;

@property (strong, nonatomic) UILabel *label1;
@property (strong, nonatomic) UILabel *label2;
@end

@implementation FirstLevelViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [BMResourceManager sharedInstance].videoTrackerInfoDelegate = self;
    
}

- (void)boomVideoTrackCallbackWithEvent:(BOOMEventCode)eventCode withData:(NSDictionary *)detailData {
    switch (eventCode) {
            //  Recommended callback event codes
        case kAdViewLoaded:
        {
            [self.label1 removeFromSuperview];
            self.label1 = nil;
            [self.label2 removeFromSuperview];
            self.label2 = nil;
            NSLog(@"Ad View is Loaded on Screen");
        }
            
            break;
        case kAdViewClosed:
        {
            [self performSegueWithIdentifier:@"secondLevelSegue" sender:self];
            NSLog(@"Ad View is Removed from Screen");
        }
            break;
        case kAdFailed: {
            NSLog(@"Ad Failed to Load");
            // errorInfo indicates that which type of failure occurred. We can easily get error Info as shown below:
            NSString *errorInfo = [detailData valueForKey:kErrorInfo];
            
            // errorDescription is optional and it can be used for debugging purpose for getting more information about error. We can easily get error Description as shown below:
            //            NSString *errorDescription = [detailData valueForKey:kErrorDescription];
            
            if ([errorInfo isEqualToString:kNoFill]) {
                NSLog(@"Ad Not Available at the moment");
                
            } else if ([errorInfo isEqualToString:kNetworkError]) {
                NSLog(@"Network Not Available");
            } else if ([errorInfo isEqualToString:kInternalError]) {
                NSLog(@"Internal Error, Not able to serve the Ad");
            }
            
        }
            break;
        case kPointsRevealed:
            NSLog(@"points Revealed: %@",[detailData valueForKey:kGetPoints]);
            break;
            //  Optional callback event codes
        case kSuccessfulSharedOnFacebook:
            NSLog(@"Ad Shared On Facebook");
            break;
        case kSuccessfulSharedOnTwitter:
            NSLog(@"Ad Shared On Twitter");
            break;
        case kSuccessfulSharedOnGooglePlus:
            NSLog(@"Ad Shared On Google Plus");
            break;
        default:
            break;
    }
}

- (void)viewDidAppear:(BOOL)animated {
    [self animateView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(BOOL)shouldAutorotate{
    return YES;
}

-(NSUInteger)supportedInterfaceOrientations {
    
    return UIInterfaceOrientationMaskLandscape;
}

- (void)animateView {
   
    self.label1 = [[UILabel alloc] initWithFrame:CGRectMake(0.0f, [self fetchHeight]/2 - [self fetchHeight]/4, [self fetchWidth]/2, [self fetchHeight]/5 + 10)];
    [self.label1 setText:@"BOOM"];
    [self.label1 setTextColor:[UIColor whiteColor]];
    [self.label1 setAlpha:0.5f];
    [self.label1 setFont:[UIFont systemFontOfSize:[self fetchHeight]/5]];
    [self.view addSubview:self.label1];
    [UIView animateWithDuration:8.0f
                          delay:0.0f
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [self.label1 setFrame:CGRectMake([self fetchWidth] - 340, [self fetchHeight]/2 - [self fetchHeight]/4, [self fetchWidth]/2, [self fetchHeight]/5 + 10)];
                     }
                     completion:nil];
    [self.view bringSubviewToFront:self.label1];
    
    
    self.label2 = [[UILabel alloc] initWithFrame:CGRectMake([self fetchWidth] - 340, [self fetchHeight]/2, [self fetchWidth]/2, [self fetchHeight]/5 + 10)];
    [self.label2 setText:@"BOOM"];
    [self.label2 setAlpha:0.5f];
    [self.label2 setTextColor:[UIColor whiteColor]];
    [self.label2 setFont:[UIFont systemFontOfSize:[self fetchHeight]/5]];
    [self.view addSubview:self.label2];
    [UIView animateWithDuration:8.0f
                          delay:0.0f
                        options:  UIViewAnimationOptionRepeat | UIViewAnimationOptionAutoreverse
                     animations:^{
                         [self.label2 setFrame:CGRectMake(0, [self fetchHeight]/2, [self fetchWidth]/2, [self fetchHeight]/5 + 10)];
                     }
                     completion:nil];
    [self.view bringSubviewToFront:self.label2];
    
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

- (IBAction)secondLevelButton:(id)sender {
    NSLog(@"BOOM %@",self.boomGuid);
    [[BMResourceManager sharedInstance] showVideoForGUID:self.boomGuid withType:BMPreroll];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    [self.label1 removeFromSuperview];
    self.label1 = nil;
    [self.label2 removeFromSuperview];
    self.label2 = nil;
    
    if ([segue.identifier isEqualToString:@"secondLevelSegue"]) {
        SecondLevelViewController *secondViewController = segue.destinationViewController;
    }
}
- (IBAction)backButton:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
