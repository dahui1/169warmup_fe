//
//  ViewController.h
//  warmup_fe
//
//  Created by Yaohui Ye on 10/2/14.
//  Copyright (c) 2014 Yaohui Ye. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AFHTTPRequestOperationManager.h"
#import "HomeViewController.h"

@interface ViewController : UIViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *textUser;
@property (weak, nonatomic) IBOutlet UITextField *textPwd;
@property (weak, nonatomic) IBOutlet UILabel *labelLogin;

@property (weak, nonatomic) NSString *count;

- (IBAction)btnLogin:(id)sender;
- (IBAction)btnAdd:(id)sender;
- (BOOL) textFieldShouldReturn: (UITextField *) textField;
- (IBAction)backgroundTap:(id)sender;

@end
