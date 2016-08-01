//
//  UIMusicControlView.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/29.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIMusicControlView.h"
#import <Masonry/Masonry.h>

@interface UIMusicControlView ()

@property (nonatomic, strong) UIButton *backForwardButton;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *fastForwardButton;

@end


@implementation UIMusicControlView

#pragma mark - lifecycle -

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.backForwardButton];
        [self addSubview:self.playButton];
        [self addSubview:self.fastForwardButton];
        [self setConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setConstraints
{
    [self.backForwardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.height.equalTo(self);
        make.width.equalTo(self.backForwardButton.mas_height);
        make.size.equalTo(self.playButton);
        make.size.equalTo(self.fastForwardButton);
    }];

    [self.playButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.centerY.equalTo(self);
        make.left.equalTo(self.backForwardButton.mas_right).with.offset(60);
        make.right.equalTo(self.fastForwardButton.mas_left).with.offset(-60);
    }];

    [self.fastForwardButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self);
    }];
}

#pragma mark - getter && setter -


- (UIButton *)backForwardButton
{
    if(!_backForwardButton){
        _backForwardButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _backForwardButton.tintColor = [UIColor whiteColor];
        [_backForwardButton setBackgroundImage:[UIImage imageNamed:@"backForward"] forState:UIControlStateNormal];
        _backForwardButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _backForwardButton;
}

- (UIButton *)playButton
{
    if(!_playButton){
        _playButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _playButton.tintColor = [UIColor whiteColor];
        _playButton.imageView.image = [UIImage imageNamed:@"play"];
        [_playButton setBackgroundImage:[UIImage imageNamed:@"play"] forState:UIControlStateNormal];
        _playButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _playButton;
}

- (UIButton *)fastForwardButton
{
    if(!_fastForwardButton){
        _fastForwardButton = [UIButton buttonWithType:UIButtonTypeSystem];
        _fastForwardButton.tintColor = [UIColor whiteColor];
        _fastForwardButton.imageView.image = [UIImage imageNamed:@"fastForward"];
        [_fastForwardButton setBackgroundImage:[UIImage imageNamed:@"fastForward"] forState:UIControlStateNormal];
        _fastForwardButton.imageView.contentMode = UIViewContentModeScaleAspectFill;
    }
    return _fastForwardButton;
}


@end
