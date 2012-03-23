//
//  UserNameViewController.m
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "UserNameViewController.h"
#import "NSString+AESCrypt.h"
#import "ViewController.h"

@interface UserNameViewController ()

@end

@implementation UserNameViewController

@synthesize userName = _userName;

@synthesize user = _user;



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
    
    //[self performSegueWithIdentifier:@"Input User Name and go to Lock View" sender:self];
    /*
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];


    self.user = [ud objectForKey:@"oh my password name"];
    NSLog(@"%@", self.user);
    if (self.user == nil) {
        
    }
    else {
        
        [self enterUserName:self];
        
    }
     */
     

}

- (void)viewDidUnload
{
    [self setUserName:nil];
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}



- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;
}

- (IBAction)enterUserName:(id)sender {
    
    if (self.user) {
        self.userName.text = self.user;
        [self performSegueWithIdentifier:@"Input User Name and go to Lock View" sender:self];
    }
    
    if ([self.userName.text isEqualToString:@""]) {
        UIAlertView *alret = [[UIAlertView alloc] initWithTitle:@"Warrning" message:@"You must input name!!!" delegate:nil cancelButtonTitle:nil otherButtonTitles:@"OK", nil];
        [alret show];
    }
    else {
        NSLog(@"%@", self.userName.text);
        NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
        [ud setObject:self.userName.text forKey:@"oh my password name"];

        [self performSegueWithIdentifier:@"Input User Name and go to Lock View" sender:self];
    }

}

- (void)viewWillAppear:(BOOL)animated
{
    
    NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    
    
    self.user = [ud objectForKey:@"oh my password name"];
    NSLog(@"%@", self.user);
    if (self.user == nil) {
        
    }
    else {
        
        [self performSegueWithIdentifier:@"Input User Name and go to Lock View" sender:self];        
    }
    //NSUserDefaults *ud = [NSUserDefaults standardUserDefaults];
    /*
    UIStoryboard *board = [UIStoryboard storyboardWithName:@"MainStoryboard" bundle:nil];
    ViewController *vc = [board instantiateViewControllerWithIdentifier:@"ViewController"];
    [self presentModalViewController:vc animated:NO];
    
    [super viewWillAppear:animated];
     */
    
    //[self performSegueWithIdentifier:@"Input User Name and go to Lock View" sender:self];
     
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
