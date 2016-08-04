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

    [self.view addSubview:self.dragView];
    [self.view addSubview:self.controlButtonCollectionView];
    [self.view addSubview:self.lightSlider];
    [self.view addSubview:self.musicView];
    [self.view addSubview:self.airDropView];
    [self.view addSubview:self.appButtonCollectionView];

    [self setupConstraints];

    self.view.backgroundColor = [UIColor lightGrayColor];
}

#pragma mark - delegate -

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    UIButtonCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class]) forIndexPath:indexPath];
    ControlCollectionCellModel *model;

    if (collectionView == self.controlButtonCollectionView) {
        model = self.controlButtonCellModels[indexPath.section][indexPath.item];
        cell.buttonSelectedFlag = model.selectedFlag;
    } else if (collectionView == self.appButtonCollectionView) {
        model = self.appButtonCellModels[indexPath.section][indexPath.item];
    }
    cell.buttonCanSelectedFlag = (collectionView == self.controlButtonCollectionView);
    cell.roundFlag = (collectionView == self.controlButtonCollectionView);
    [cell setBackGroundImage:model.image];

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

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    if(collectionView == self.controlButtonCollectionView){
        UIButtonCollectionViewCell *cell = (UIButtonCollectionViewCell *)[collectionView cellForItemAtIndexPath:indexPath];
        NSIndexPath *indexPath = [self.controlButtonCollectionView indexPathForCell:cell];
        BOOL selectedFlag = self.controlButtonCellModels[indexPath.section][indexPath.item].selectedFlag;
        self.controlButtonCellModels[indexPath.section][indexPath.row].selectedFlag = !selectedFlag;
    }
}

#pragma mark - private -

- (void)setupConstraints
{
    [self.dragView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.top.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.05f);
    }];
    [self.controlButtonCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.13f);
        make.top.equalTo(self.dragView.mas_bottom);
    }];
    [self.lightSlider mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view.mas_height).multipliedBy(0.11f);
        make.top.equalTo(self.controlButtonCollectionView.mas_bottom);
    }];
    [self.musicView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.4f);
        make.top.equalTo(self.lightSlider.mas_bottom);
    }];
    [self.airDropView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.centerX.equalTo(self.view);
        make.height.equalTo(self.view).multipliedBy(0.11f);
        make.top.equalTo(self.musicView.mas_bottom);
    }];
    [self.appButtonCollectionView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.bottom.centerX.equalTo(self.view);
        make.top.equalTo(self.airDropView.mas_bottom);
    }];
}

#pragma mark - event -

- (void)handleControlButtonClick:(UIButtonCollectionViewCell *)cell
{
}

#pragma mark - getter && setter -

- (UIView *)dragView
{
    if (!_dragView) {
        _dragView = [[UIView alloc] init];
        _dragView.backgroundColor = [UIColor lightGrayColor];
    }
    return _dragView;
}

- (UICollectionView *)controlButtonCollectionView
{
    if (!_controlButtonCollectionView) {
        UIControlCollectionViewFlowLayout *layout = [[UIControlCollectionViewFlowLayout alloc] init];

        layout.itemSize = CGSizeMake(35, 35);
        CGFloat innerSpace = (self.view.bounds.size.width - 5 * 35) / 6;
        layout.sectionInset = UIEdgeInsetsMake(5, innerSpace, 5, innerSpace);
        layout.minimumLineSpacing = innerSpace;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        _controlButtonCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _controlButtonCollectionView.backgroundColor = [UIColor lightGrayColor];
        _controlButtonCollectionView.delegate = self;
        _controlButtonCollectionView.dataSource = self;
        _controlButtonCollectionView.showsHorizontalScrollIndicator = NO;
        [_controlButtonCollectionView registerClass:[UIButtonCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class])];
    }
    return _controlButtonCollectionView;
}

- (UIControlCenterSlider *)lightSlider
{
    if (!_lightSlider) {
        _lightSlider = [[UIControlCenterSlider alloc] init];
        _lightSlider.backgroundColor = [UIColor grayColor];
        _lightSlider.controlCenterSlider.minimumValueImage = [UIImage imageNamed:@"left-light"];
        _lightSlider.controlCenterSlider.maximumValueImage = [UIImage imageNamed:@"right-light"];
    }
    return _lightSlider;
}

- (UIMusicView *)musicView
{
    if (!_musicView) {
        _musicView = [[UIMusicView alloc] init];
        _musicView.musicTitleLabel.text = @"网易云音乐";
        _musicView.musicLyricsLabel.text = @"嘿嘿嘿嘿嘿";
        _musicView.backgroundColor = [UIColor lightGrayColor];
    }
    return _musicView;
}

- (UIHighLightButton *)airDropView
{
    if (!_airDropView) {
        _airDropView = [[UIHighLightButton alloc] init];
        _airDropView.backgroundColor = [UIColor grayColor];
        _airDropView.title.text = @"AirDrop 共享";
        _airDropView.title.font = [UIFont systemFontOfSize:14];
        _airDropView.title.textColor = [UIColor blackColor];
    }
    return _airDropView;
}

- (UICollectionView *)appButtonCollectionView
{
    if (!_appButtonCollectionView) {
        UIControlCollectionViewFlowLayout *layout = [[UIControlCollectionViewFlowLayout alloc] init];

        layout.itemSize = CGSizeMake(60, 60);
        CGFloat innerSpace = (self.view.bounds.size.width - 4 * 60) / 5;
        layout.sectionInset = UIEdgeInsetsMake(5, innerSpace, 5, innerSpace);
        layout.minimumLineSpacing = innerSpace;
        layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

        _appButtonCollectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:layout];
        _appButtonCollectionView.backgroundColor = [UIColor lightGrayColor];
        _appButtonCollectionView.delegate = self;
        _appButtonCollectionView.dataSource = self;
        _appButtonCollectionView.showsHorizontalScrollIndicator = NO;
        [_appButtonCollectionView registerClass:[UIButtonCollectionViewCell class] forCellWithReuseIdentifier:NSStringFromClass([UIButtonCollectionViewCell class])];
    }
    return _appButtonCollectionView;
}

- (NSMutableArray<NSArray<ControlCollectionCellModel *> *> *)appButtonCellModels
{
    if (!_appButtonCellModels) {
        _appButtonCellModels = [[NSMutableArray alloc] init];
        NSMutableArray <ControlCollectionCellModel *> *tempControlButtonCollectionModel = [[NSMutableArray alloc] init];
        for (int section = 0; section < 2; section++) {
            for (int item = 0; item < 4; item++) {
                ControlCollectionCellModel *model = [[ControlCollectionCellModel alloc] initWithImageName:@"wifi" roundFlag:YES canSelected:NO];
                [tempControlButtonCollectionModel addObject:model];
            }
            [_appButtonCellModels addObject:[tempControlButtonCollectionModel copy]];
            [tempControlButtonCollectionModel removeAllObjects];
        }
    }
    return _appButtonCellModels;
}

- (NSMutableArray<NSArray<ControlCollectionCellModel *> *> *)controlButtonCellModels
{
    if (!_controlButtonCellModels) {
        _controlButtonCellModels = [[NSMutableArray alloc] init];
        NSMutableArray <ControlCollectionCellModel *> *tempControlButtonCollectionModel = [[NSMutableArray alloc] init];
        for (int section = 0; section < 2; section++) {
            for (int item = 0; item < 5; item++) {
                ControlCollectionCellModel *model = [[ControlCollectionCellModel alloc] initWithImageName:@"bluetooth" roundFlag:YES canSelected:YES];
                [tempControlButtonCollectionModel addObject:model];
            }
            [_controlButtonCellModels addObject:[tempControlButtonCollectionModel copy]];
            [tempControlButtonCollectionModel removeAllObjects];
        }
    }
    return _controlButtonCellModels;
}

@end