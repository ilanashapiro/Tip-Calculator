//
//  SettingsViewController.m
//  Tip Calculator
//
//  Created by ilanashapiro on 6/25/19.
//  Copyright © 2019 ilanashapiro. All rights reserved.
//

#import "SettingsViewController.h"

@interface SettingsViewController ()
@property (weak, nonatomic) IBOutlet UISegmentedControl *defaultTip;

@end

@implementation SettingsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    double doubleValue = [defaults doubleForKey:@"default_tip_percentage"];
    
    NSInteger selectedSegment;
    
    if(doubleValue == 0.22) {
        selectedSegment = 2;
    }
    else if(doubleValue == 0.20) {
        selectedSegment = 1;
    }
    else {
        selectedSegment = 0;
    }
    [self.defaultTip setSelectedSegmentIndex:selectedSegment];
    NSLog(@"View will appear");
}

- (IBAction)onSelect:(id)sender {
    NSArray *percentages = @[@(0.15), @(0.2), @(0.22)];
    double tipPercentage = [percentages[self.defaultTip.selectedSegmentIndex] doubleValue];
    NSLog(@"%f", tipPercentage);
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setDouble:tipPercentage forKey:@"default_tip_percentage"];
    [defaults synchronize];
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
