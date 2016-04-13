//
//  ViewController.m
//  Boom
//
//  Created by Boom on 25/02/15.
//  Copyright (c) 2015 BM. All rights reserved.
//

#import "ViewController.h"
#import "FirstLevelViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIPickerView *pickerView;
- (IBAction)startButton:(id)sender;
@property (nonatomic, copy) NSString *boomGuid;
@property (nonatomic, strong) NSMutableArray *dataArray;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"%f,%f",self.view.frame.size.width,self.view.frame.size.height);
    
    self.dataArray = [[NSMutableArray alloc] initWithObjects:@"27b55f7e-f75e-4d97-9b33-07f27a2856e5",@"91db1880-af5b-4ac9-aab4-a097b5becf3d",@"2c180ecf-9f96-4a99-8649-45df06de627a",@"91db1880-af5b-4ac9-aab4-a097b5becf3d", @"3207f013-1626-4cd7-9ad7-1905af309013", @"0b06a643-5ed7-497a-9982-a8a375d89053", @"84b753b7-6e99-4502-bb38-915ea6c9e98a", @"591e4815-53f5-48d6-8159-bbd6e1089098", nil];
    self.boomGuid = [self.dataArray objectAtIndex:0];
    
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [self.dataArray count];
}

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component {
    self.boomGuid = [self.dataArray objectAtIndex:row];
    NSLog(@"DATA:%@",self.boomGuid);
}

- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [self.dataArray objectAtIndex:row];
}

- (NSAttributedString *)pickerView:(UIPickerView *)pickerView
             attributedTitleForRow:(NSInteger)row
                      forComponent:(NSInteger)component
{
    return [[NSAttributedString alloc] initWithString:[self.dataArray objectAtIndex:row]
                                           attributes:@
            {
            NSForegroundColorAttributeName:[UIColor whiteColor]
            }];
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

- (IBAction)startButton:(id)sender {
    [self performSegueWithIdentifier:@"firstLevelSegue" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    
    if ([segue.identifier isEqualToString:@"firstLevelSegue"]) {
        FirstLevelViewController *firstViewController = segue.destinationViewController;
        firstViewController.boomGuid = self.boomGuid;
    }
}

@end
