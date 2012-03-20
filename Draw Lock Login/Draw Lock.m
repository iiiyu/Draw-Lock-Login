//
//  Draw Lock.m
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Draw Lock.h"

@implementation Draw_Lock

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}


- (void)drawBackgroundAtColor:(CGFloat)red  atGreen:(CGFloat)green atBlue:(CGFloat)blue atAphla:(CGFloat)aphla inContext:(CGContextRef)context
{
     
    NSLog(@"begin drawing background");
    UIGraphicsPushContext(context);
    CGContextBeginPath(context);
    

    // 移动到原点
    CGContextMoveToPoint(context, 0, 0);
    
    // 右上角
    CGContextAddLineToPoint(context, self.bounds.size.width, 0);
    // 右下角
    CGContextAddLineToPoint(context, self.bounds.size.width, self.bounds.size.height);
    // 左下角
    CGContextAddLineToPoint(context, 0, self.bounds.size.height);
    
    // 闭合路径
    CGContextClosePath(context);
    
    // 填充半透明黑色
    CGContextSetRGBFillColor(context, red, green, blue, aphla);
    
    CGContextDrawPath(context, kCGPathFill);
    
    
    CGContextStrokePath(context);
    UIGraphicsPopContext();
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"i'm begin drawing....");
    // Drawing code
    
    // 获取CGContext，注意UIKit里用的是一个专门的函数
    CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw background
    [self drawBackgroundAtColor:0.0 atGreen:0.0 atBlue:0.0 atAphla:0.8 inContext:context];
    
    
}


@end
