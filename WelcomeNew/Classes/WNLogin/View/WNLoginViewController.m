//
//  WNLoginViewController.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/30.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNLoginViewController.h"
#import "WNLoginViewModel.h"
@interface WNLoginViewController ()
@property (nonatomic, strong) UIImageView *backImage;
@property (nonatomic, strong) UILabel *accountLab;
@property (nonatomic, strong) UITextField *accountTF;
@property (nonatomic, strong) UIView *accountLine;
@property (nonatomic, strong) UILabel *passwordLab;
@property (nonatomic, strong) UITextField *passwordTF;
@property (nonatomic, strong) UIView *passwordLine;
@property (nonatomic, strong) UIButton *loginBtn;
@property (nonatomic, strong) UIButton *forgetBtn;
@property (nonatomic, strong) UIButton *registerBtn;
@property (nonatomic, strong) WNLoginViewModel *viewModel;
@end

@implementation WNLoginViewController

- (void)setUpUI{
    [super setUpUI];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
    self.titleText = @"";
    self.titleView.lineView.hidden = YES;
    //创建界面
    [self setUpUIs];
}
- (void)setUpUIs{
    [self.view addSubview:self.backImage];
    [self.view addSubview:self.accountLab];
    [self.view addSubview:self.accountTF];
    [self.view addSubview:self.accountLine];
    [self.view addSubview:self.passwordLab];
    [self.view addSubview:self.passwordTF];
    [self.view addSubview:self.passwordLine];
    [self.view addSubview:self.forgetBtn];
    [self.view addSubview:self.registerBtn];
    [self.view addSubview:self.loginBtn];
    
    [self.backImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.right.mas_equalTo(self.view);
        make.height.offset(214);
    }];
    [self.accountLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.backImage.mas_bottom).offset(25);
        make.left.equalTo(self.view.mas_left).offset(48);
        make.width.offset(63);
        make.height.offset(30);
    }];
    [self.accountTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLab.mas_right);
        make.bottom.equalTo(self.accountLab.mas_bottom);
        make.right.equalTo(self.view.mas_right).offset(-44);
        make.height.equalTo(self.accountLab.mas_height);
    }];
    [self.accountLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(44);
        make.top.equalTo(self.accountLab.mas_bottom);
        make.right.equalTo(self.accountTF.mas_right);
        make.height.offset(1);
    }];
    [self.passwordLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.accountLine.mas_bottom).offset(63);
        make.left.equalTo(self.accountLab.mas_left);
        make.width.height.mas_equalTo(self.accountLab);
    }];
    [self.passwordTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.passwordLab.mas_right);
        make.right.equalTo(self.accountLine.mas_right);
        make.bottom.equalTo(self.passwordLab.mas_bottom);
        make.height.mas_equalTo(self.passwordLab);
    }];
    [self.passwordLine mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.accountLine.mas_left);
        make.top.equalTo(self.passwordLab.mas_bottom);
        make.right.equalTo(self.accountLine.mas_right);
        make.height.offset(1);
    }];
    [self.forgetBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.passwordLine.mas_bottom).offset(10);
        make.right.equalTo(self.view.mas_right).offset(-47);
    }];
    [self.registerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.forgetBtn.mas_bottom).offset(17);
        make.centerX.equalTo(self.forgetBtn.mas_centerX);
    }];
    [self.loginBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.height.offset(47);
        make.left.equalTo(self.view.mas_left).offset(46);
        make.right.equalTo(self.view.mas_right).offset(-46);
        make.bottom.equalTo(self.view.mas_bottom).offset(-78);
    }];
}
 
#pragma mark -action
- (void)loginBtnAction{
    if (![self.passwordTF.text isEqualToString:@"666666"] || ![self.accountTF.text isEqualToString:@"12345678"]) {
        [self WNAlertErrorMessage];
        return;
    }
    WeakSelf(self);
    [self.viewModel loadLoginDataWithAccoutn:self.accountTF.text withPassword:self.passwordTF.text success:^(WNLoginModel * _Nonnull model) {
        dispatch_async(dispatch_get_main_queue(), ^{
            [weakself.navigationController popViewControllerAnimated:YES];
            if (weakself.successBlock) {
                weakself.successBlock(model);
            }
            
        });
    }];
}
- (void)forgetBtnAction{
    
}
- (void)registerBtnAction{
    
}

- (void)WNAlertErrorMessage{
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"提示" message:@"密码不正确请您重新输入" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction *conform = [UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        
    }];
    [alert addAction:conform];
    [self presentViewController:alert animated:YES completion:nil];
}
#pragma mark -getter
- (UIImageView *)backImage{
    if (!_backImage) {
        _backImage = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNLoginBackImage"]];
    }
    return _backImage;
}
- (UILabel *)accountLab{
    if (!_accountLab) {
        _accountLab = [[UILabel alloc] init];
        _accountLab.text = @"账号：";
        _accountLab.font = WNFontWithPFMediumForSize(21.0f);
        _accountLab.textColor = SXRGB16Color(0x222222);
    }
    return _accountLab;
}
- (UITextField *)accountTF{
    if (!_accountTF) {
        _accountTF = [[UITextField alloc] init];
        _accountTF.font = [UIFont systemFontOfSize:16.0f];
        _accountTF.placeholder = @"请输入账号";
//        _accountTF.delegate = self;
    }
    return _accountTF;
}
- (UIView *)accountLine{
    if (!_accountLine) {
        _accountLine = [[UIView alloc] init];
        _accountLine.backgroundColor = SXRGB16Color(0x222222);
    }
    return _accountLine;
}
- (UILabel *)passwordLab{
    if (!_passwordLab) {
        _passwordLab = [[UILabel alloc] init];
        _passwordLab.text = @"密码：";
        _passwordLab.font = WNFontWithPFMediumForSize(21.0f);
        _passwordLab.textColor = SXRGB16Color(0x222222);
    }
    return _passwordLab;
}
- (UITextField *)passwordTF{
    if (!_passwordTF) {
        _passwordTF = [[UITextField alloc] init];
        _passwordTF.font = [UIFont systemFontOfSize:16.0f];
        _passwordTF.placeholder = @"请输入密码";
        _passwordTF.secureTextEntry = YES;
//        _passwordTF.delegate = self;
    }
    return _passwordTF;
}
- (UIView *)passwordLine{
    if (!_passwordLine) {
        _passwordLine = [[UIView alloc] init];
        _passwordLine.backgroundColor = SXRGB16Color(0x222222);
    }
    return _passwordLine;
}
- (UIButton *)loginBtn{
    if (!_loginBtn) {
        _loginBtn = [[UIButton alloc] init];
        [_loginBtn setTitle:@"登录" forState:UIControlStateNormal];
        [_loginBtn setBackgroundColor:SXRGB16Color(0x4B77F3)];
        _loginBtn.titleLabel.font = WNFontWithPFMediumForSize(21.0f);
        _loginBtn.layer.shadowColor = SXRGB16Color(0x4B77F3).CGColor;
        _loginBtn.layer.cornerRadius = 10.0f;
        _loginBtn.layer.shadowOffset = CGSizeMake(0,0);
        _loginBtn.layer.shadowOpacity = 0.6;
        _loginBtn.layer.shadowRadius = 8;
        [_loginBtn addTarget:self action:@selector(loginBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _loginBtn;
}
- (UIButton *)forgetBtn{
    if (!_forgetBtn) {
        _forgetBtn = [[UIButton alloc] init];
        [_forgetBtn setTitle:@"忘记密码？" forState:UIControlStateNormal];
        [_forgetBtn setTitleColor:SXRGB16Color(0x999999) forState:UIControlStateNormal];
        _forgetBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_forgetBtn addTarget:self action:@selector(forgetBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _forgetBtn;
}
- (UIButton *)registerBtn{
    if (!_registerBtn) {
        _registerBtn = [[UIButton alloc] init];
        [_registerBtn setTitle:@"注册" forState:UIControlStateNormal];
        [_registerBtn setTitleColor:SXRGB16Color(0x999999) forState:UIControlStateNormal];
        _registerBtn.titleLabel.font = [UIFont systemFontOfSize:12.0f];
        [_registerBtn addTarget:self action:@selector(registerBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _registerBtn;
}
- (WNLoginViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNLoginViewModel alloc] init];
    }
    return _viewModel;
}
@end
