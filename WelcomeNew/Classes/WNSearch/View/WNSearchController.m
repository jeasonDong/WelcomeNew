//
//  WNSearchController.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNSearchController.h"
#import "WNSearchCell.h"
#import "WNSearchModel.h"
#import "WNSearchViewModel.h"
#import "WNUniversityInfoController.h"
@interface WNSearchController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic, strong) UIView *navView;
@property (nonatomic, strong) UITextField *searchTF;
@property (nonatomic, strong) UIButton *cancelBtn;
@property (nonatomic, strong) UITableView *searchTabV;
@property (nonatomic, strong) NSArray *schoolArr;
@property (nonatomic, strong) WNSearchViewModel *viewModel;
@end

@implementation WNSearchController

- (void)setUpUI{
    [super setUpUI];
    self.titleView.hidden = YES;
    [self setUpUIs];
    self.schoolArr = nil;
}
- (void)setUpUIs{
    [self.view addSubview:self.navView];
    [self.navView addSubview:self.searchTF];
    [self.navView addSubview:self.cancelBtn];
    [self.view addSubview:self.searchTabV];
    [self.navView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.offset(navigation_height);
    }];
    [self.searchTabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.view);
        make.top.equalTo(self.navView.mas_bottom);
    }];
    [self.cancelBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.navView.mas_right).offset(0);
        make.bottom.equalTo(self.navView.mas_bottom).offset(0);
        make.width.offset(60);
        make.height.offset(45);
    }];
    [self.searchTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.navView.mas_left).offset(12);
        make.right.equalTo(self.cancelBtn.mas_left).offset(-5);
        make.bottom.equalTo(self.navView.mas_bottom).offset(-5);
        make.height.offset(34);
    }];
}
#pragma mark -action
- (void)cancelBtnAction{
    [self.navigationController popViewControllerAnimated:YES];
}

#pragma mark UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.schoolArr.count;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WNSearchCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WNSearchCell"];
    if (cell == nil) {
        cell = [[WNSearchCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WNSearchCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    WNSearchModel *model = self.schoolArr[indexPath.row];
    cell.model = model;
    return cell;
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 50;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WNUniversityInfoController *WNVC = [[WNUniversityInfoController alloc] init];
    WNVC.universityName = @"西南大学";
    [self.navigationController pushViewController:WNVC animated:YES];
}
#pragma mark -UITextFieldDelegate
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    [self.viewModel loadSearchDataWithText:string];
    return YES;
}
#pragma mark -getter
- (UIView *)navView{
    if (!_navView) {
        _navView = [[UIView alloc] init];
        _navView.backgroundColor = [UIColor whiteColor];
    }
    return _navView;
}
- (UITextField *)searchTF{
    if (!_searchTF) {
        _searchTF = [[UITextField alloc] init];
        _searchTF.backgroundColor = SXRGB16Color(0xF9F9F9);
        _searchTF.font = WNFontWithPFRegularForSize(14.0f);
        UIImageView *imgView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNSearch"]];
        _searchTF.leftView =imgView;
        _searchTF.placeholder = @"输入您的学校名称";
        _searchTF.delegate = self;
        _searchTF.leftViewMode = UITextFieldViewModeAlways;
    }
    return _searchTF;
}
- (UIButton *)cancelBtn{
    if (!_cancelBtn) {
        _cancelBtn = [[UIButton alloc] init];
        [_cancelBtn setTitle:@"取消" forState:UIControlStateNormal];
        [_cancelBtn setTitleColor:SXRGB16Color(0x4B77F3) forState:UIControlStateNormal];
        _cancelBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        [_cancelBtn addTarget:self action:@selector(cancelBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _cancelBtn;
}
- (UITableView *)searchTabV{
    if (!_searchTabV) {
        _searchTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _searchTabV.backgroundColor = SXRGB16Color(0xF6F7FA);
        _searchTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _searchTabV.bounces = NO;
        _searchTabV.delegate = self;
        _searchTabV.dataSource = self;
    }
    return _searchTabV;
}
- (WNSearchViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNSearchViewModel alloc] init];
        WeakSelf(self);
        _viewModel.schoolDataBlock = ^(NSArray * _Nonnull dataArr) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakself.schoolArr = dataArr;
                [weakself.searchTabV reloadData];
            });
        };
    }
    return _viewModel;
}
@end
