//
//  UIControlCenterView.m
//  ControlCenter
//
//  Created by 罗向宇 on 16/8/1.
//  Copyright © 2016年 罗向宇. All rights reserved.
//

#import "UIControlCenterViewController.h"
#import "ControlCollectionCellModel.h"
#import "UIMusicView.h"
#import "UIHighLightButton.h"
#import "UIButtonCollectionViewCell.h"
#import "UIControlCollectionViewFlowLayout.h"
#import <Masonry/Masonry.h>

@interface UIControlCenterViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) UIView *dragView;
@property (nonatomic, strong) UICollectionView *controlButtonCollectionView;
@property (nonatomic, strong) UIControlCenterSlider *lightSlider;
@property (nonatomic, strong) UIMusicView *musicView;
@property (nonatomic, strong) UIHighLightButton *airDropView;
@property (nonatomic, strong) UICollectionView *appButtonCollectionView;
@property (nonatomic, strong) NSMutableArray <NSArray <ControlCollectionCellModel *> *> *controlButtonCellModels;
@property (nonatomic, strong) NSMutableArray <NSArray <ControlCollectionCellModel *> *> *appButtonCellModels;
@property (nonatomic, assign) CGFloat beginDragLocationX;

@end

@implementation UIControlCenterViewController

#pragma mark - lifecycle -

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self initDragView];
    [self initControlButtonCollectionView];
    [self initControlButtonCollectionModel];
    [self initLightSlider];
    [self initMusicView];
    [self initAirDropView];
    [self initAppButtonCollectionView];
    [self initAppButtonCollectionModel];
    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - delegate -

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIButtonCollectionViewCell *cell;
    ControlCollectionCellModel *model;
    if (collectionView == self.controlButtonCollectionView) {
        model = self.controlButtonCellModels[indexPath.section][indexPath.item];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class]) forIndexPath:indexPath];
        cell.roundFlag = YES;
        [cell setBackGroundImage:model.image];
        [cell.cellButton setAction:^(UIHighLightButton *button) {
            model.selectedFlag = !model.selectedFlag;
            if (model.selectedFlag) {
                button.backgroundColor = [UIColor whiteColor];
            } else {
                button.backgroundColor = [UIColor grayColor];
            }
        }];
    } else if (collectionView == self.appButtonCollectionView) {
        model = self.appButtonCellModels[indexPath.section][indexPath.item];
        cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class]) forIndexPath:indexPath];
        cell.roundFlag = NO;
        [cell setBackGroundImage:model.image];
        [cell.cellButton setAction:^(UIHighLightButton *button) {
            button.backgroundColor = [UIColor grayColor];
        }];
    }

    if (model.selectedFlag) {
        cell.cellButton.backgroundColor = [UIColor whiteColor];
    } else {
        cell.cellButton.backgroundColor = [UIColor grayColor];
    }


    return cell;
}

#pragma mark - datasource -

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    if (collectionView == self.controlButtonCollectionView) {
        return self.controlButtonCellModels.count;
    } else if (collectionView == self.appButtonCollectionView) {
        return self.appButtonCellModels.count;
    }
    return 0;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    if (collectionView == self.controlButtonCollectionView) {
        return self.controlButtonCellModels[section].count;
    } else if (collectionView == self.appButtonCollectionView) {
        return self.appButtonCellModels[section].count;
    }
    return 0;
}

#pragma mark - private -

- (void)initControlButtonCollectionModel
{
    self.controlButtonCellModels = [[NSMutableArray alloc] init];
    NSMutableArray <ControlCollectionCellModel *> *tempControlButtonCollectionModel = [[NSMutableArray alloc] init];
    for (int section = 0; section < 2; section++) {
        for (int item = 0; item < 5; item++) {
            ControlCollectionCellModel *model = [[ControlCollectionCellModel alloc] initWithImageName:@"bluetooth" roundFlag:YES canSelected:YES];
            [tempControlButtonCollectionModel addObject:model];
        }
        [self.controlButtonCellModels addObject:[tempControlButtonCollectionModel copy]];
        [tempControlButtonCollectionModel removeAllObjects];
    }
}

- (void)initAppButtonCollectionModel
{
    self.appButtonCellModels = [[NSMutableArray alloc] init];
    NSMutableArray <ControlCollectionCellModel *> *tempControlButtonCollectionModel = [[NSMutableArray alloc] init];
    for (int section = 0; section < 2; section++) {
        for (int item = 0; item < 4; item++) {
            ControlCollectionCellModel *model = [[ControlCollectionCellModel alloc] initWithImageName:@"wifi" roundFlag:YES canSelected:NO];
            [tempControlButtonCollectionModel addObject:model];
        }
        [self.appButtonCellModels addObject:[tempControlButtonCollectionModel copy]];
        [tempControlButtonCollectionModel removeAllObjects];
    }
}

- (void)initDragView
{
    self.dragView = [[UIView alloc] init];
    self.dragView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.dragView];
    [self.dragView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.top.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.05f);
    }];
}

- (void)initControlButtonCollectionView
{
    UIControlCollectionViewFlowLayout *layout = [[UIControlCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(35, 35);
    CGFloat innerSpace = (self.view.bounds.size.width - 5 * 35) / 6;
    layout.sectionInset = UIEdgeInsetsMake(5, innerSpace, 5, innerSpace);
    layout.minimumLineSpacing = innerSpace;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.controlButtonCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.controlButtonCollectionView.backgroundColor = [UIColor lightGrayColor];
    self.controlButtonCollectionView.delegate = self;
    self.controlButtonCollectionView.dataSource = self;
    self.controlButtonCollectionView.showsHorizontalScrollIndicator = NO;
    [self.controlButtonCollectionView registerClass:[UIButtonCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class])];
    [self.view addSubview:self.controlButtonCollectionView];
    [self.controlButtonCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.13f);
        make.top.equalTo(self.dragView.mas_bottom);
    }];
}

- (void)initLightSlider
{
    self.lightSlider = [[UIControlCenterSlider alloc] init];
    self.lightSlider.backgroundColor = [UIColor grayColor];
    self.lightSlider.controlCenterSlider.minimumValueImage = [UIImage imageNamed:@"left-light"];
    self.lightSlider.controlCenterSlider.maximumValueImage = [UIImage imageNamed:@"right-light"];
    [self.view addSubview:self.lightSlider];
    [self.lightSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.11f);
        make.top.equalTo(self.controlButtonCollectionView.mas_bottom);
    }];
}

- (void)initMusicView
{
    self.musicView = [[UIMusicView alloc] init];
    self.musicView.musicTitleLabel.text = @"网易云音乐";
    self.musicView.musicLyricsLabel.text = @"嘿嘿嘿嘿嘿";
    self.musicView.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:self.musicView];
    [self.musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.4f);
        make.top.equalTo(self.lightSlider.mas_bottom);
    }];
}

- (void)initAirDropView
{
    self.airDropView = [[UIHighLightButton alloc] init];
    self.airDropView.backgroundColor = [UIColor grayColor];
    [self.airDropView setTitle:@"AirDrop 共享" forState:UIControlStateNormal];
    self.airDropView.titleLabel.font = [UIFont systemFontOfSize:14];
    [self.airDropView setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.airDropView setTitleColor:[UIColor whiteColor] forState:UIControlStateSelected];
    [self.view addSubview:self.airDropView];
    [self.airDropView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.11f);
        make.top.equalTo(self.musicView.mas_bottom);
    }];
}

- (void)initAppButtonCollectionView
{
    UIControlCollectionViewFlowLayout *layout = [[UIControlCollectionViewFlowLayout alloc] init];
    layout.itemSize = CGSizeMake(60, 60);
    CGFloat innerSpace = (self.view.bounds.size.width - 4 * 60) / 5;
    layout.sectionInset = UIEdgeInsetsMake(5, innerSpace, 5, innerSpace);
    layout.minimumLineSpacing = innerSpace;
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.appButtonCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
    self.appButtonCollectionView.backgroundColor = [UIColor lightGrayColor];
    self.appButtonCollectionView.delegate = self;
    self.appButtonCollectionView.dataSource = self;
    self.appButtonCollectionView.showsHorizontalScrollIndicator = NO;
    [self.appButtonCollectionView registerClass:[UIButtonCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class])];
    [self.view addSubview:self.appButtonCollectionView];
    [self.appButtonCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.bottom.centerX.equalTo(self.view);
        make.top.equalTo(self.airDropView.mas_bottom);
    }];
}

@end