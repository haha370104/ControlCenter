//
//  AirDropButton.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIHighLightButton.h"
#import <Masonry/Masonry.h>

@interface UIHighLightButton ()

@property (nonatomic, strong) UIImageView *backgroundImageView;
@property (nonatomic, strong) UILabel *title;

@end

@implementation UIHighLightButton

#pragma mark - lifecycle -

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.title];
        [self addSubview:self.backgroundImageView];
        [self setupConstraints];
    }
    return self;
}

#pragma mark - public -

- (void)setBackgroundImage:(UIImage *)image
{
    self.backgroundImageView.image = image;
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.title mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.height.equalTo(self).multipliedBy(0.7f);
    }];

    [self.backgroundImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerX.centerY.equalTo(self);
    }];
}

#pragma mark - event -

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesBegan:touches withEvent:event];
    if (self.backgroundColor == [UIColor whiteColor]) {
        self.backgroundColor = [UIColor grayColor];
    } else {
        self.backgroundColor = [UIColor whiteColor];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesMoved:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint endedPoint = [touch locationInView:self];
    Boolean inButton = CGRectContainsPoint(self.bounds, endedPoint);
    if(!inButton){
        if(self.selectedFlag){
            self.backgroundColor = [UIColor whiteColor];
        }else{
            self.backgroundColor = [UIColor grayColor];
        }
    }
}

- (void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [super touchesEnded:touches withEvent:event];
    UITouch *touch = [touches anyObject];
    CGPoint endedPoint = [touch locationInView:self];
    Boolean inButton = CGRectContainsPoint(self.bounds, endedPoint);
    if (inButton) {
        self.selectedFlag = !self.selectedFlag;
    }
}

- (void)touchesCancelled:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if(self.selectedFlag){
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor grayColor];
    }
}

#pragma mark - getter && setter -

- (UIImageView *)backgroundImageView
{
    if(!_backgroundImageView){
        _backgroundImageView = [[UIImageView alloc]initWithFrame:self.bounds];
    }
    return _backgroundImageView;
}

- (UILabel *)title
{
    if(!_title){
        _title = [[UILabel alloc]initWithFrame:self.bounds];
    }
    return _title;
}

- (void)setSelectedFlag:(BOOL)selectedFlag
{
    _selectedFlag = selectedFlag;
    if(self.selectedFlag){
        self.backgroundColor = [UIColor whiteColor];
    }else{
        self.backgroundColor = [UIColor grayColor];
    }
}

@end
