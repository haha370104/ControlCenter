//
//  UIHighlightUnSelectedButton.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/8/4.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIHighLightUnSelectableButton.h"

@implementation UIHighLightUnSelectableButton

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint endedPoint = [touch locationInView:self];
    Boolean inButton = CGRectContainsPoint(self.bounds, endedPoint);
    if (inButton) {
        [NSTimer scheduledTimerWithTimeInterval:0.3 target:self selector:@selector(setBackgroundColorWithGray) userInfo:nil repeats:NO];
    }
}

- (void)setBackgroundColorWithGray
{
    self.backgroundColor = [UIColor grayColor];
}

@end
