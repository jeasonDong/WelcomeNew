//
//  WNHomepageController.m
//  WelcomeNew
//
//  Created by dix on 2019/9/23.
//  Copyright © 2019年 dix. All rights reserved.
//

#import "WNHomepageController.h"
#import "WNHomepageCell.h"
#import "WNHomepageModel.h"
#import "WNHomepageViewModel.h"
#import "WNMineView.h"
#import "WNLoginViewController.h"
#import "WNSearchController.h"
#import "WNUniversityInfoController.h"
@interface WNHomepageController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UIButton *iconBtn;
@property (nonatomic, strong) UILabel *searchlLab;
@property (nonatomic, strong) UIImageView *searchIMGV;
@property (nonatomic, strong) UIView *showView;
@property (nonatomic, strong) UILabel *universityLab;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UITableView *universityTabV;
@property (nonatomic, strong) NSArray <WNHomepageModel *> *modelData;
@property (nonatomic, strong) WNHomepageViewModel *viewModel;
@property (nonatomic, strong) WNLoginModel *model;
@end
@implementation WNHomepageController

- (void)setUpUI{
    [super setUpUI];
    self.titleView.hidden = YES;
    self.modelData = nil;
    //创建界面
    [self setUpUIs];
    //获取数据
    [self getModels];
}
- (void)setUpUIs{
    [self.view addSubview:self.navView];
    [self.navView addSubview:self.iconBtn];
    [self.navView addSubview:self.searchlLab];
    [self.searchlLab addSubview:self.searchIMGV];
    [self.view addSubview:self.showView];
    [self.showView addSubview:self.universityLab];
    [self.showView addSubview:self.lineView];
    [self.view addSubview:self.universityTabV];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.offset(navigation_height + 20);
    }];
    [self.iconBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navView.mas_left).offset(18);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-12);
        make.height.width.offset(32);
    }];
    [self.searchlLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconBtn.mas_right).offset(14);
        make.right.equalTo(self.navView.mas_right).offset(-18);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-8);
        make.height.offset(40);
    }];
    [self.searchIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.searchlLab.mas_top).offset(8);
        make.bottom.equalTo(self.searchlLab.mas_bottom).offset(-8);
        make.right.equalTo(self.searchlLab.mas_right).offset(-18);
        make.width.offset(24);
    }];
    [self.showView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.view);
        make.top.equalTo(self.navView.mas_bottom).offset(0);
        make.height.offset(64);
    }];
    [self.universityLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.showView.mas_left).offset(18);
        make.top.equalTo(self.showView.mas_top).offset(20);
        make.width.offset(72);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.showView);
        make.height.offset(1);
    }];
    [self.universityTabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.top.mas_equalTo(self.showView.mas_bottom);
    }];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
    UIImage *iconImage = isLogin() == NO ? [UIImage imageNamed:@"WNIconNeedLogin"] : [UIImage imageNamed:@"WNIconImage"];
    [self.iconBtn setImage:iconImage forState:UIControlStateNormal];
    [self.iconBtn setImage:iconImage forState:UIControlStateHighlighted];
}
- (void)getModels{
    WeakSelf(self);
    [self.viewModel loadHomepageData:^(NSArray * _Nonnull response) {
        dispatch_async(dispatch_get_main_queue(), ^{
            weakself.modelData = response;
            [weakself.universityTabV reloadData];
        });
    }];
    
}
#pragma mark iconBtnAction
- (void)iconBtnAction{
    WeakSelf(self);
    if (isLogin()) {
        [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
        WNMineView *WNView = [[WNMineView alloc] initWithFrame:self.view.frame];
        WNView.navigationController = self.navigationController;
        WNView.removeBlock = ^{
            UIImage *iconImage = isLogin() == NO ? [UIImage imageNamed:@"WNIconNeedLogin"] : [UIImage imageNamed:@"WNIconImage"];
            [weakself.iconBtn setImage:iconImage forState:UIControlStateNormal];
            [weakself.iconBtn setImage:iconImage forState:UIControlStateHighlighted];
        };
        WNView.model = getWNLoginModel();
        [self.navigationController.topViewController.view addSubview:WNView];
    }else{
        WNLoginViewController *WNVC = [[WNLoginViewController alloc] init];
        WNVC.successBlock = ^(WNLoginModel * _Nonnull model) {
            [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
            WNMineView *WNView = [[WNMineView alloc] initWithFrame:weakself.view.frame];
            WNView.navigationController = weakself.navigationController;
            WNView.removeBlock = ^{
                UIImage *iconImage = isLogin() == NO ? [UIImage imageNamed:@"WNIconNeedLogin"] : [UIImage imageNamed:@"WNIconImage"];
                [weakself.iconBtn setImage:iconImage forState:UIControlStateNormal];
                [weakself.iconBtn setImage:iconImage forState:UIControlStateHighlighted];
            };
            WNView.model = model;
            [weakself.navigationController.topViewController.view addSubview:WNView];
        };
        [self.navigationController pushViewController:WNVC animated:YES];
    }
}
- (void)touchesUpInsideToSearch{
    WNSearchController *WNVC = [[WNSearchController alloc] init];
    [self.navigationController pushViewController:WNVC animated:YES];
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.modelData.count;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WNHomepageCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WNHomepageCell"];
    if (cell == nil) {
        cell = [[WNHomepageCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WNHomepageCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    WNHomepageModel *model = self.modelData[indexPath.row];
    cell.model = model;
    WeakSelf(self)
    cell.locatinBtnblock = ^(WNHomepageModel * _Nonnull model) {
        [weakself.viewModel locationBtnActionWithNavigationController:weakself.navigationController];
    };
    return cell;
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WNUniversityInfoController *WNVC = [[WNUniversityInfoController alloc] init];
    WNVC.universityName = self.modelData[indexPath.row].universityName;
    [self.navigationController pushViewController:WNVC animated:YES];
}
#pragma mark -getter
- (UIView *)navView{
    if (!_navView) {
        _navView = [[UIView alloc] init];
        _navView.backgroundColor = [UIColor whiteColor];
    }
    return _navView;
}

- (UIButton *)iconBtn{
    if (!_iconBtn) {
        _iconBtn = [[UIButton alloc] init];
        [_iconBtn setImage:[UIImage imageNamed:@"WNIconImage"] forState:UIControlStateNormal];
        [_iconBtn setImage:[UIImage imageNamed:@"WNIconImage"] forState:UIControlStateHighlighted];
        [_iconBtn addTarget:self action:@selector(iconBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _iconBtn;
}
- (UILabel *)searchlLab{
    if (!_searchlLab) {
        _searchlLab = [[UILabel alloc] init];
        _searchlLab.text = @"     搜索您的学校";
        _searchlLab.font = WNFontWithPFRegularForSize(14.0f);
        _searchlLab.textColor = SXRGB16Color(0xCCCCCC);
        _searchlLab.backgroundColor = SXRGB16Color(0xF9F9F9);
        _searchlLab.layer.cornerRadius = 20.0f;
        _searchlLab.layer.masksToBounds = YES;
        _searchlLab.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesUpInsideToSearch)];
        [_searchlLab addGestureRecognizer:tap];
    }
    return _searchlLab;
}
- (UIImageView *)searchIMGV{
    if (!_searchIMGV) {
        _searchIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNSearchImage"]];
        _searchIMGV.userInteractionEnabled = YES;
    }
    return _searchIMGV;
}
- (UIView *)showView{
    if (!_showView) {
        _showView = [[UIView alloc] init];
        _showView.backgroundColor = [UIColor whiteColor];
    }
    return _showView;
}
- (UILabel *)universityLab{
    if (!_universityLab) {
        _universityLab = [[UILabel alloc] init];
        _universityLab.text = @"热门大学";
        _universityLab.font = WNFontWithPFMediumForSize(18.0f);
        _universityLab.textColor = SXRGB16Color(0x222222);
    }
    return _universityLab;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SXRGB16Color(0xF2F2F2);
    }
    return _lineView;
}
- (UITableView *)universityTabV{
    if (!_universityTabV) {
        _universityTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _universityTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _universityTabV.bounces = NO;
        _universityTabV.delegate = self;
        _universityTabV.dataSource = self;
    }
    return _universityTabV;
}
- (WNHomepageViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNHomepageViewModel alloc] init];
    }
    return _viewModel;
}
@end
