//
//  ViewController.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/7/28.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "ViewController.h"
#import "UIControlCenterViewController.h"
#import <Masonry/Masonry.h>

@interface ViewController ()

@property (nonatomic, strong) UIControlCenterViewController *controlCenterViewController;

@end

@implementation ViewController

#pragma mark - lifecycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initControlCenterViewController];
}

#pragma mark - private -

- (void)initControlCenterViewController
{
    self.controlCenterViewController = [[UIControlCenterViewController alloc] init];
    [self.view addSubview:self.controlCenterViewController.view];
    [self.controlCenterViewController.view mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.width.bottom.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.6f);
    }];
}

@end
