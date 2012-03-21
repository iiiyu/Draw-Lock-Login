//
//  UserNameViewController.h
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserNameViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *userName;

- (IBAction)enterUserName:(id)sender;

- (IBAction)textFieldDoneEditing:(id)sender;

- (IBAction)backgroundTap:(id)sender;
@end
