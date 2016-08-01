//
//  UIControlCenterSlider.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIControlCenterSlider.h"
#import <Masonry/Masonry.h>

@interface UIControlCenterSlider ()

@property (nonatomic, strong) UISlider *controlCenterSlider;

@end

@implementation UIControlCenterSlider

#pragma mark - lifecycle -

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.controlCenterSlider];
        [self setConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setConstraints
{
    [self.controlCenterSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.center.equalTo(self);
        make.width.equalTo(self).multipliedBy(0.8f);
    }];
}

#pragma mark - getter && setter -

- (UISlider *)controlCenterSlider
{
    if(!_controlCenterSlider){
        _controlCenterSlider = [[UISlider alloc]init];
        [_controlCenterSlider setThumbImage:[UIImage imageNamed:@"round"] forState:UIControlStateNormal];
        _controlCenterSlider.minimumTrackTintColor = [UIColor whiteColor];
        _controlCenterSlider.maximumTrackTintColor = [UIColor blackColor];
    }
    return _controlCenterSlider;
}
@end
