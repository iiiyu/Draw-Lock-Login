//
//  UserNameViewController.h
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-21.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UserNameViewController : UIViewController{
    NSString *user;
}

@property (weak, nonatomic) IBOutlet UITextField *userName;

@property (strong, nonatomic) NSString *user;

- (IBAction)enterUserName:(id)sender;

- (IBAction)textFieldDoneEditing:(id)sender;

- (IBAction)backgroundTap:(id)sender;
@end
