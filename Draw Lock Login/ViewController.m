//
//  ViewController.m
//  Draw Lock Login
//
//  Created by ChenYu Xiao on 12-3-20.
//  Copyright (c) 2012年 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "Draw Lock.h"


//#define MATRIX_SIZE 3

@interface ViewController ()

@end

@implementation ViewController

@synthesize paths = _paths;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    /*
    Draw_Lock *v = (Draw_Lock *)self.view;
        [v setSubviewImageButton];
     */
   
}

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
}

- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if (_paths == nil) {
        _paths = [[NSMutableArray alloc] init];
    }
  
    //_paths = [[NSMutableArray alloc] init];
    NSLog(@"begin");
}

- (void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"Move");
    CGPoint pt = [[touches anyObject] locationInView:self.view];
    UIView *touched = [self.view hitTest:pt withEvent:event];
    
    Draw_Lock *v = (Draw_Lock *)self.view;
    [v drawLineFromLastDotTo:pt];
    
    if (touched!=self.view) {
        NSLog(@"touched view tag: %d ", touched.tag);
        
        BOOL found = NO;
        for (NSNumber *tag in _paths) {
            found = tag.integerValue==touched.tag;
            if (found)
                break;
        }
        
        if (found)
            return;
        
        [_paths addObject:[NSNumber numberWithInt:touched.tag]];
        [v addDotView:touched];
        
        // 设置点的状态
        UIImageView* iv = (UIImageView*)touched;
        iv.highlighted = YES;
    }
}

- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"End");
    Draw_Lock *v = (Draw_Lock *)self.view;
    [v clearDotViews];
    
    for (UIView *view in self.view.subviews)
        if ([view isKindOfClass:[UIImageView class]])
            [(UIImageView*)view setHighlighted:NO];
    
    [self.view setNeedsDisplay];
    
    [_paths removeAllObjects];

    
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    return NO;

}

@end
