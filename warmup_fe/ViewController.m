//
//  ViewController.m
//  warmup_fe
//
//  Created by Yaohui Ye on 10/2/14.
//  Copyright (c) 2014 Yaohui Ye. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

@synthesize textUser;
@synthesize textPwd;
@synthesize count;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnLogin:(id)sender {
    NSString* user  = textUser.text;
    NSString* pwd   = textPwd.text;
    
    AFHTTPRequestOperationManager *client = [AFHTTPRequestOperationManager manager];
    [client POST:@"http://warmupyeyh.herokuapp.com/users/login"
      parameters:@{@"user": user, @"password": pwd}
      success:^(AFHTTPRequestOperation *operation, id responseObject) {
          
          NSDictionary *result = (NSDictionary *)responseObject;
          NSString *errorCode = (NSString *)[result objectForKey:@"errCode"];
          int error = [errorCode intValue];
          if (error > 0) {
              count = (NSString *)[result objectForKey:@"count"];
              [self performSegueWithIdentifier:@"login_success" sender:self];
              NSLog(@"Login succeeded with username %@ and password %@", user, pwd);
          } else if (error == -1){
              UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Login Failed!"
                                                                  message:@"Invalid username and password combination. Please try again."
                                                                 delegate:self
                                                        cancelButtonTitle:@"OK"
                                                        otherButtonTitles:nil, nil];
              [alertView show];
              NSLog(@"Login Failed with username %@ and password %@", user, pwd);
          }
          NSLog(@"Server Response: \n%@", responseObject);
      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
          UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Request failed!"
                                                              message:@"Request failed. Please try again later."
                                                             delegate:self
                                                    cancelButtonTitle:@"OK"
                                                    otherButtonTitles:nil, nil];
          [alertView show];
          NSLog(@"Request failed due to fatal error.");
      }];
}

- (IBAction)btnAdd:(id)sender {
    NSString* user  = textUser.text;
    NSString* pwd   = textPwd.text;
    
    AFHTTPRequestOperationManager *client = [AFHTTPRequestOperationManager manager];
    [client POST:@"http://warmupyeyh.herokuapp.com/users/add"
      parameters:@{@"user": user, @"password": pwd}
         success:^(AFHTTPRequestOperation *operation, id responseObject) {
             
             NSDictionary *result = (NSDictionary *)responseObject;
             NSString *errorCode = (NSString *)[result objectForKey:@"errCode"];
             int error = [errorCode intValue];
             if (error > 0) {
                 count = (NSString *)[result objectForKey:@"count"];
                 [self performSegueWithIdentifier:@"login_success" sender:self];
                 NSLog(@"Add user succeeded with username %@ and password %@", user, pwd);
             } else if (error == -2){
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add User Failed!"
                                                                     message:@"This username already exists. Please try again."
                                                                    delegate:self
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil, nil];
                 [alertView show];
                 NSLog(@"Add user failed with username %@ and password %@: user existed", user, pwd);
             } else if (error == -3) {
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add User Failed!"
                                                                     message:@"The user name should be non-empty and at most 128 characters long. Please try again."
                                                                    delegate:self
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil, nil];
                 [alertView show];
                 NSLog(@"Add user failed with username %@ and password %@: illegal user name", user, pwd);
             } else {
                 UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Add User Failed!"
                                                                     message:@"The password should be at most 128 characters long. Please try again."
                                                                    delegate:self
                                                           cancelButtonTitle:@"OK"
                                                           otherButtonTitles:nil, nil];
                 [alertView show];
                 NSLog(@"Add user failed with username %@ and password %@: illegal password", user, pwd);
             }
             NSLog(@"Server Response: \n%@", responseObject);
         } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
             UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"Request failed!"
                                                                 message:@"Request failed. Please try again later."
                                                                delegate:self
                                                       cancelButtonTitle:@"OK"
                                                       otherButtonTitles:nil, nil];
             [alertView show];
             NSLog(@"Request failed due to fatal error.");
         }];
}

- (BOOL) textFieldShouldReturn: (UITextField *) textField {
    [textField resignFirstResponder];
    return YES;
}

- (IBAction)backgroundTap:(id)sender {
    [self.view endEditing: YES];
}

- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    NSString *user = textUser.text;
    if([segue.identifier isEqualToString:@"login_success"]) {
        HomeViewController *destination = segue.destinationViewController;
        destination.count = count;
        destination.user = user;
    }
}


@end
