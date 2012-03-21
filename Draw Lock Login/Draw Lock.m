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

@synthesize trackPointValue = _trackPointValue;
@synthesize dotViews = _dotViews;


-(void)setup
{
    self.backgroundColor = [UIColor darkGrayColor];
    [self setSubviewImageButton];
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
    }
    return self;
}

- (void)clearDotViews
{
    [_dotViews removeAllObjects];
}

- (void)addDotView:(UIView*)view
{
    if (!_dotViews) {
        _dotViews = [NSMutableArray array];
    }
    [_dotViews addObject:view];
}

- (void)drawLineFromLastDotTo:(CGPoint)pt
{
    _trackPointValue = [NSValue valueWithCGPoint:pt];
    [self setNeedsDisplay];
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
    if (!_trackPointValue)
        return;
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, 10.0);
    CGColorSpaceRef colorspace = CGColorSpaceCreateDeviceRGB();
    CGFloat components[] = {0.5, 0.5, 0.5, 0.8};
    CGColorRef color = CGColorCreate(colorspace, components);
    CGContextSetStrokeColorWithColor(context, color);
    
    CGPoint from;
    UIView *lastDot;
    for (UIView *dotView in _dotViews) {
        from = dotView.center;
        NSLog(@"drwaing dotview: %@", dotView);
        NSLog(@"\tdrawing from: %f, %f", from.x, from.y);
        
        if (!lastDot)
            CGContextMoveToPoint(context, from.x, from.y);
        else
            CGContextAddLineToPoint(context, from.x, from.y);
        
        lastDot = dotView;
    }
    
    CGPoint pt = [_trackPointValue CGPointValue];
    NSLog(@"\t to: %f, %f", pt.x, pt.y);
    CGContextAddLineToPoint(context, pt.x, pt.y);
    
    CGContextStrokePath(context);
    CGColorSpaceRelease(colorspace);
    CGColorRelease(color);
    
    _trackPointValue = nil;
    NSLog(@"i'm begin drawing line");
  
    
}


@end
