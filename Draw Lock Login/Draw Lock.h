//
//  Draw Lock.h
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Draw_Lock : UIView{
    NSValue *trackPointValue;
    NSMutableArray *dotViews;
    
}

@property (nonatomic, strong) NSValue *trackPointValue;
@property (nonatomic, strong) NSMutableArray *dotViews;


- (void)clearDotViews;
- (void)addDotView:(UIView*)view;
- (void)drawLineFromLastDotTo:(CGPoint)pt;
- (void)setSubviewImageButton;

@end
