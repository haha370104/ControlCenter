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
    if(self){
        [self addSubview:self.cellButton];
        [self addObserver:self forKeyPath:NSStringFromSelector(@selector(roundFlag)) options:NSKeyValueObservingOptionNew context:nil];
        [self setConstraints];
    }
    return self;
}

#pragma mark - public -

- (void)setBackGroundImage: (UIImage *)backgroundImage
{
    self.cellButton.tintColor = [UIColor whiteColor];
    [self.cellButton setBackgroundImage:backgroundImage forState:UIControlStateNormal];
}

#pragma mark - private -

- (void)setConstraints
{
    [self.cellButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.centerX.centerY.equalTo(self);
    }];
}

#pragma mark - KVO -

- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSString *,id> *)change context:(void *)context
{
    if(object == self && [keyPath isEqualToString:NSStringFromSelector(@selector(roundFlag))])
    {
        if(self.roundFlag){
            self.cellButton.layer.cornerRadius = CGRectGetWidth(self.bounds) / 2;
        }else{
            self.cellButton.layer.cornerRadius = CGRectGetWidth(self.bounds) / 8;
        }
    }
}

#pragma mark - getter && setter -

- (UIButton *)cellButton
{
    if(!_cellButton){
        _cellButton = [[UIHighLightButton alloc]init];
        _cellButton.backgroundColor = [UIColor grayColor];
    }
    return _cellButton;
}

@end
