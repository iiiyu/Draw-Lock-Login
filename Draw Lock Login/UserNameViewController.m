//
//  UserNameViewController.m
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserNameViewController.h"

@interface UserNameViewController ()

@end

@implementation UserNameViewController
@synthesize userName = _userName;

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
}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

- (IBAction)enterUserName:(id)sender {
    if ([self.userName.text isEqualToString:@""]) {
        UIAlertView *alret = [[UIAlertView alloc] initWithTitle:@"Warrning" message:@"You must input name!!!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alret show];
    }
    else {
        NSLog(@"%@", self.userName.text);
        [self performSegueWithIdentifier:@"Input User Name and go to Lock View" sender:self];
    }
    //NSString *username = ;
}

// 完成关闭键盘
- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}
// 点击屏幕关闭键盘
- (IBAction)backgroundTap:(id)sender {
    [self.userName resignFirstResponder];
}
@end
