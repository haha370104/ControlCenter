//
//  UIMusicView.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIMusicView.h"
#import <Masonry/Masonry.h>

@interface UIMusicView ()

@property (nonatomic, strong) UILabel *musicTitleLabel;
@property (nonatomic, strong) UILabel *musicLyricsLabel;
@property (nonatomic, strong) UIMusicControlView *musicControlView;
@property (nonatomic, strong) UIControlCenterSlider *voiceSlider;

@end

@implementation UIMusicView

#pragma mark - lifecycle -

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if(self){
        [self addSubview:self.musicTitleLabel];
        [self addSubview:self.musicLyricsLabel];
        [self addSubview:self.musicControlView];
        [self addSubview:self.voiceSlider];
        [self setConstraints];
    }
    return self;
}

#pragma mark - private -

- (void)setConstraints
{
    [self.musicTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self).with.offset(10);
    }];

    [self.musicLyricsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.musicTitleLabel.mas_bottom).with.offset(10);
    }];

    [self.musicControlView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self);
        make.top.equalTo(self.musicLyricsLabel.mas_bottom).with.offset(10);
        make.height.equalTo(self).multipliedBy(0.25f);
        make.width.equalTo(self).multipliedBy(0.5f);
    }];

    [self.voiceSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.equalTo(self);
        make.top.equalTo(self.musicControlView.mas_bottom).with.offset(10);
        make.bottom.equalTo(self).with.offset(-10);
    }];
}

#pragma mark - getter && setter -

- (UILabel *)musicTitleLabel
{
    if(!_musicTitleLabel){
        _musicTitleLabel = [[UILabel alloc]init];
        _musicTitleLabel.font = [UIFont systemFontOfSize:16];
        _musicTitleLabel.textColor = [UIColor whiteColor];
    }
    return _musicTitleLabel;
}

- (UILabel *)musicLyricsLabel
{
    if(!_musicLyricsLabel){
        _musicLyricsLabel = [[UILabel alloc]init];
        _musicLyricsLabel.font = [UIFont systemFontOfSize:16];
        _musicLyricsLabel.textColor = [UIColor whiteColor];
    }
    return _musicLyricsLabel;
}

- (UIMusicControlView *)musicControlView
{
    if(!_musicControlView){
        _musicControlView = [[UIMusicControlView alloc]init];
    }
    return _musicControlView;
}

- (UIControlCenterSlider *)voiceSlider
{
    if(!_voiceSlider){
        _voiceSlider = [[UIControlCenterSlider alloc]init];
        _voiceSlider.controlCenterSlider.minimumValueImage = [UIImage imageNamed:@"low-voice"];
        _voiceSlider.controlCenterSlider.maximumValueImage = [UIImage imageNamed:@"high-voice"];
    }
    return _voiceSlider;
}

@end
