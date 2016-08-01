//
//  AirDropButton.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIHighLightButton.h"

@implementation UIHighLightButton

#pragma mark - lifecycle -

#pragma mark - event -

- (void)setHighlighted:(BOOL)highlighted
{
    [super setHighlighted:highlighted];
    if (highlighted) {
        self.backgroundColor = [UIColor whiteColor];
    } else {
        self.backgroundColor = [UIColor grayColor];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (self.backgroundColor == [UIColor whiteColor]) {
        self.backgroundColor = [UIColor grayColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint endedPoint = [touch locationInView:self];
    Boolean inButton = CGRectContainsPoint(self.bounds, endedPoint);
    if (inButton && self.action) {
        self.action(self);
    }
}

@end
