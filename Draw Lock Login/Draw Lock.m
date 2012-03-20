//
//  Draw Lock.m
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "Draw Lock.h"

#define MATRIX_SIZE 3

@implementation Draw_Lock


-(void)setup
{
    self.backgroundColor = [UIColor darkGrayColor];
}

// 老头说过不直接调用initWithFrame 而是调用awakeFromNib来进行初始化
// 进过测试 initWithFrame也不会被调用
- (void)awakeFromNib
{
    [self setup];
}

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        NSLog(@"hello");
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

- (void)setSubviewImageButton
{
    // 初始subview
    for (int i = 0; i < MATRIX_SIZE; i++) {
        for (int j = 0; j < MATRIX_SIZE; j++) {
            UIImage *dotImage = [UIImage imageNamed:@"dot_off.png"];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:dotImage
                                                       highlightedImage:[UIImage imageNamed:@"dot_on.png"]];
            imageView.frame = CGRectMake(0, 0, dotImage.size.width, dotImage.size.height);
            imageView.userInteractionEnabled = YES;
            imageView.tag = j * MATRIX_SIZE + i + 1;
            [self addSubview:imageView];
        }
    }
    
    // 重新设置每一个subview的位置
    int w = self.frame.size.width / MATRIX_SIZE;
    int h = self.frame.size.height / MATRIX_SIZE;
    
    int i = 0;
    for (UIView *view in self.subviews)
        if ([view isKindOfClass:[UIImageView class]]) {
            int x = w * (i / MATRIX_SIZE) + w / 2;
            int y = h * (i % MATRIX_SIZE) + h / 2;
            view.center = CGPointMake(x, y);
            i++;
        }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    NSLog(@"i'm begin drawing....");
    // Drawing code
    
    // 获取CGContext，注意UIKit里用的是一个专门的函数
    //
    //CGContextRef context = UIGraphicsGetCurrentContext();
    
    // draw background 
    //[self drawBackgroundAtColor:0.0 atGreen:0.0 atBlue:0.0 atAphla:0.8 inContext:context];
    
    // 蛋碎了 都想办法画了背景  然后发现view的背景可以这样设置 不过上面的是可以画成透明的
    // self.backgroundColor = [UIColor darkGrayColor];
    [self setSubviewImageButton];
    
    
}


@end
