//
//  ViewController.h
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController{
    NSMutableArray  *paths;
    NSMutableString  *key;
    BOOL FIRST;
    
}

@property (nonatomic, strong) NSMutableArray *paths;

@property (nonatomic, strong) NSMutableString *key;


@property (weak, nonatomic) IBOutlet UILabel *tipsLoginLabel;

@end
