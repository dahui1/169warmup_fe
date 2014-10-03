//
//  HomeViewController.m
//  warmup_fe
//
//  Created by Yaohui Ye on 10/2/14.
//  Copyright (c) 2014 Yaohui Ye. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

@synthesize user;
@synthesize count;
@synthesize labelMsg;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    NSString *temp = [NSString stringWithFormat:@"%@%@%@%@%@", @"Welcome, ", user, @". You have logged in ", count, @" times."];
    labelMsg.text = temp;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)returnToFirstPage:(id)sender {
    [self  dismissViewControllerAnimated:YES  completion:^{}];
}

@end
