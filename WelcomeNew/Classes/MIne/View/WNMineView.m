//
//  WNMineView.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNMineView.h"
#import "WNMineViewModel.h"
#import "WNHistoryController.h"
#import "WNAboutUsController.h"
#import "WNContactUsController.h"
@interface WNMineView ()
@property (nonatomic, strong) WNMineViewModel *viewModel;
@property (nonatomic, strong) UIView *mineView;
@property (nonatomic, strong) UIView *backgroundView;
//登录
@property (nonatomic, strong) UIButton *loginBtn;
//名称
@property (nonatomic, strong) UILabel *nameLab;
//ID
@property (nonatomic, strong) UILabel *IDLab;
//历史记录
@property (nonatomic, strong) UIButton *historyRecordsBtn;
//关于我们
@property (nonatomic, strong) UIButton *aboutUsBtn;
//意见反馈
@property (nonatomic, strong) UIButton *contactUsBtn;
//退出
@property (nonatomic, strong) UIButton *logoutBtn;
@end
@implementation WNMineView

- (instancetype)initWithFrame:(CGRect)frame{
    self= [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor colorWithWhite:0 alpha:0.6];
        [self setUpUIs];
    }
    return self;
}
- (void)setUpUIs{
    [self addSubview:self.mineView];
    
    CGRect rcMine = self.frame;
    rcMine.size.width = 200;
    [UIView animateWithDuration:0.4f animations:^{
        self.mineView.frame = rcMine;
    }];
    [self.mineView addSubview:self.loginBtn];
    [self.mineView addSubview:self.nameLab];
    [self.mineView addSubview:self.IDLab];
    [self.mineView addSubview:self.historyRecordsBtn];
    [self.mineView addSubview:self.aboutUsBtn];
    [self.mineView addSubview:self.contactUsBtn];
    [self.mineView addSubview:self.logoutBtn];
    [self addSubview:self.backgroundView];
}
- (void)layoutSubviews{
    [super layoutSubviews];
    CGRect rcFrame = self.mineView.frame;
    CGRect rcLoginBtn = rcFrame;
    rcLoginBtn.origin.x = 68;
    rcLoginBtn.origin.y = 36;
    rcLoginBtn.size.height = 64;
    rcLoginBtn.size.width = 64;
    self.loginBtn.frame = rcLoginBtn;
    
    CGRect rcNameLab = rcLoginBtn;
    rcNameLab.origin.x = 0;
    rcNameLab.origin.y += rcLoginBtn.size.height + 13;
    rcNameLab.size.height = 27;
    rcNameLab.size.width = rcFrame.size.width;
    self.nameLab.frame = rcNameLab;
    
    CGRect rcIDLab = rcNameLab;
    rcIDLab.origin.y += rcNameLab.size.height + 2;
    rcIDLab.size.height = 20;
    self.IDLab.frame = rcIDLab;
    
    CGRect rcHistoryRecordsBtn = rcIDLab;
    rcHistoryRecordsBtn.origin.y += rcIDLab.size.height + 20;
    rcHistoryRecordsBtn.size.height = 60;
    self.historyRecordsBtn.frame = rcHistoryRecordsBtn;
    
    CGRect rcAboutUsBtn = rcHistoryRecordsBtn;
    rcAboutUsBtn.origin.y += rcHistoryRecordsBtn.size.height;
    self.aboutUsBtn.frame = rcAboutUsBtn;
    
    CGRect rcContactUsBtn = rcAboutUsBtn;
    rcContactUsBtn.origin.y += rcAboutUsBtn.size.height;
    self.contactUsBtn.frame = rcContactUsBtn;
    
    CGRect rcLogoutBtn = rcContactUsBtn;
    rcLogoutBtn.origin.y = rcFrame.size.height - rcContactUsBtn.size.height;
    self.logoutBtn.frame = rcLogoutBtn;
}

#pragma mark -action
- (void)loginBtnBtnAction{
    
}
- (void)historyRecordsBtnAction{
    WNHistoryController *WNVC = [[WNHistoryController alloc] init];
    [self.navigationController pushViewController:WNVC animated:YES];
}
- (void)aboutUsBtnAction{
    WNAboutUsController *WNVC = [[WNAboutUsController alloc] init];
    [self.navigationController pushViewController:WNVC animated:YES];
}
- (void)contactUsBtnAction{
    WNContactUsController *WNVC = [[WNContactUsController alloc] init];
    [self.navigationController pushViewController:WNVC animated:YES];
}
- (void)logoutBtnAction{
    [self.viewModel logoutBtnAction];
}
-(void)touchesUpInside{
    CGRect rcMine = self.mineView.frame;
    rcMine.origin.x = -200;
    [UIView animateWithDuration:0.4f animations:^{
        self.mineView.frame = rcMine;
    } completion:^(BOOL finished) {
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        [self removeFromSuperview];
    }];
}
#pragma mark -setter
- (void)setModel:(WNLoginModel *)model{
    _model = model;
    [_loginBtn setImage:[UIImage imageNamed:model.imageIcon] forState:UIControlStateNormal];
    [_loginBtn setImage:[UIImage imageNamed:model.imageIcon] forState:UIControlStateHighlighted];
    self.nameLab.text = model.name;
    self.IDLab.text = [NSString stringWithFormat:@"ID：%@",model.ID];
}
#pragma mark -getter
- (UIView *)mineView{
    if (!_mineView) {
        _mineView = [[UIView alloc] initWithFrame:CGRectMake(-200, 0, 200, kScreenHeight)];
        _mineView.backgroundColor = [UIColor whiteColor];
    }
    return _mineView;
}
- (UIView *)backgroundView{
    if (!_backgroundView) {
        _backgroundView = [[UIView alloc] initWithFrame:CGRectMake(200, 0, kScreenWidth-200, kScreenHeight)];
        _backgroundView.backgroundColor = [UIColor colorWithWhite:0 alpha:0];
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesUpInside)];
        [_backgroundView addGestureRecognizer:tap];
    }
    return _backgroundView;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setImage:[UIImage imageNamed:@"mine_iconImage"] forState:UIControlStateNormal];
        [_loginBtn setImage:[UIImage imageNamed:@"mine_iconImage"] forState:UIControlStateHighlighted];
        [_loginBtn addTarget:self action:@selector(loginBtnBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
- (WNMineViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNMineViewModel alloc] init];
        WeakSelf(self);
        _viewModel.logoutActionBlock = ^{
            if (weakself.removeBlock) {
                weakself.removeBlock();
            }
            CGRect rcMine = weakself.mineView.frame;
            rcMine.origin.x = -200;
            [UIView animateWithDuration:0.4f animations:^{
                weakself.mineView.frame = rcMine;
            } completion:^(BOOL finished) {
                [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
                [weakself removeFromSuperview];
            }];
        };
    }
    return _viewModel;
}
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.text = @"-.-～-.-";
        _nameLab.textAlignment = NSTextAlignmentCenter;
        _nameLab.font = WNFontWithPFSemiboldForSize(20.0f);
        _nameLab.textColor = SXRGB16Color(0x222222);
    }
    return _nameLab;
}
-(UILabel *)IDLab{
    if (!_IDLab) {
        _IDLab = [[UILabel alloc] init];
        _IDLab.text =@"ID：-.-";
        _IDLab.textAlignment = NSTextAlignmentCenter;
        _IDLab.font = [UIFont systemFontOfSize:14.0f];
        _IDLab.textColor = SXRGB16Color(0x999999);
    }
    return _IDLab;
}
- (UIButton *)historyRecordsBtn{
    if (!_historyRecordsBtn) {
        _historyRecordsBtn = [[UIButton alloc] init];
        [_historyRecordsBtn setImage:[UIImage imageNamed:@"historyRecordsImage"] forState:UIControlStateNormal];
        [_historyRecordsBtn setTitle:@"历史记录" forState:UIControlStateNormal];
        [_historyRecordsBtn setTitleColor:SXRGB16Color(0x222222) forState:UIControlStateNormal];
        _historyRecordsBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        _historyRecordsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 76);
        _historyRecordsBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 43);
        [_historyRecordsBtn addTarget:self action:@selector(historyRecordsBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _historyRecordsBtn;
}
- (UIButton *)aboutUsBtn{
    if (!_aboutUsBtn) {
        _aboutUsBtn = [[UIButton alloc] init];
        [_aboutUsBtn setImage:[UIImage imageNamed:@"aboutUsImage"] forState:UIControlStateNormal];
        [_aboutUsBtn setTitle:@"关于我们" forState:UIControlStateNormal];
        [_aboutUsBtn setTitleColor:SXRGB16Color(0x222222) forState:UIControlStateNormal];
        _aboutUsBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        _aboutUsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 76);
        _aboutUsBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 43);
        [_aboutUsBtn addTarget:self action:@selector(aboutUsBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _aboutUsBtn;
}
- (UIButton *)contactUsBtn{
    if (!_contactUsBtn) {
        _contactUsBtn = [[UIButton alloc] init];
        [_contactUsBtn setImage:[UIImage imageNamed:@"contactUsImage"] forState:UIControlStateNormal];
        [_contactUsBtn setTitle:@"意见反馈" forState:UIControlStateNormal];
        [_contactUsBtn setTitleColor:SXRGB16Color(0x222222) forState:UIControlStateNormal];
        _contactUsBtn.titleLabel.font = [UIFont systemFontOfSize:16.0f];
        _contactUsBtn.imageEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 76);
        _contactUsBtn.titleEdgeInsets = UIEdgeInsetsMake(0, 0, 0, 43);
        [_contactUsBtn addTarget:self action:@selector(contactUsBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _contactUsBtn;
}
- (UIButton *)logoutBtn{
    if (!_logoutBtn) {
        _logoutBtn = [[UIButton alloc] init];
        [_logoutBtn setTitle:@"退出登录" forState:UIControlStateNormal];
        [_logoutBtn setTitleColor:SXRGB16Color(0x999999) forState:UIControlStateNormal];
        _logoutBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_logoutBtn addTarget:self action:@selector(logoutBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _logoutBtn;
}
@end
