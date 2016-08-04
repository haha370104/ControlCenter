//
//  UIButtonCollectionViewCell.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIButtonCollectionViewCell.h"
#import <Masonry/Masonry.h>

@interface UIButtonCollectionViewCell ()

@property (nonatomic, strong) UIHighLightButton *cellButton;

@end

@implementation UIButtonCollectionViewCell

#pragma mark - lifecycle -

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

#pragma mark - public -

- (void)setBackGroundImage:(UIImage *)backgroundImage
{
    self.cellButton.tintColor = [UIColor whiteColor];
    [self.cellButton setBackgroundImage:backgroundImage];
}

#pragma mark - private -

- (void)setConstraints
{
    [self.cellButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerX.centerY.equalTo(self);
    }];
}

#pragma mark - getter && setter -

- (UIView *)cellButton
{
    if (!_cellButton) {
        if(_buttonCanSelectedFlag){
            _cellButton = [[UIHighLightButton alloc] init];
        }else{
            _cellButton = [[UIHighLightUnSelectableButton alloc]init];
        }
        _cellButton.backgroundColor = [UIColor grayColor];
    }
    return _cellButton;
}

- (void)setRoundFlag:(BOOL)roundFlag
{
    _roundFlag = roundFlag;
    if (self.roundFlag) {
        self.cellButton.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
    } else {
        self.cellButton.layer.cornerRadius = CGRectGetWidth(self.bounds) / 8;
    }
}

- (void)setButtonCanSelectedFlag:(BOOL)buttonCanSelectedFlag
{
    _buttonCanSelectedFlag = buttonCanSelectedFlag;
    [self addSubview:self.cellButton];
    [self setConstraints];
}

- (void)setButtonSelectedFlag:(BOOL)buttonSelectedFlag
{
    _buttonSelectedFlag = buttonSelectedFlag;
    if(buttonSelectedFlag){
        self.cellButton.backgroundColor = [UIColor whiteColor];
    }
}

@end
