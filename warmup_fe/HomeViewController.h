//
//  HomeViewController.h
//  warmup_fe
//
//  Created by Yaohui Ye on 10/2/14.
//  Copyright (c) 2014 Yaohui Ye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ViewController.h"

@interface HomeViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *labelMsg;
@property NSString *count;
@property NSString *user;

- (IBAction)returnToFirstPage:(id)sender;

@end
