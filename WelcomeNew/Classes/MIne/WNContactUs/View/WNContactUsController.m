//
//  WNContactUsController.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/19.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNContactUsController.h"

@interface WNContactUsController ()<UITextViewDelegate,UITextFieldDelegate>
@property (nonatomic, strong) UILabel *suggestLab;
@property (nonatomic, strong) UITextView *suggestTV;
@property (nonatomic, strong) UILabel *mailboxLab;
@property (nonatomic, strong) UITextField *mailboxTF;
@property (nonatomic, strong) UILabel *callLab;
@property (nonatomic, strong) UITextField *callTF;
@end

@implementation WNContactUsController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}
- (void)setUpUI{
    [super setUpUI];
    [self setUpUIs];
    self.titleText = @"意见反馈";
    self.view.backgroundColor = [UIColor whiteColor];
    [self.titleView.rightBtn setTitle:@"提交" forState:UIControlStateNormal];
    [self.titleView.rightBtn setTitleColor:SXRGB16Color(0x999999) forState:UIControlStateNormal];
    self.titleView.rightBtn.enabled = NO;
    self.titleColor = [UIColor blackColor];
}
- (void)setUpUIs{
    [self.view addSubview:self.suggestLab];
    [self.view addSubview:self.suggestTV];
    [self.view addSubview:self.mailboxLab];
    [self.view addSubview:self.mailboxTF];
    [self.view addSubview:self.callLab];
    [self.view addSubview:self.callTF];
    [self.suggestLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(16);
        make.top.equalTo(self.titleView.mas_bottom).offset(24);
    }];
    [self.suggestTV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.suggestLab.mas_left);
        make.top.equalTo(self.suggestLab.mas_bottom).offset(6);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.offset(200);
    }];
    [self.mailboxLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.suggestTV.mas_left);
        make.top.equalTo(self.suggestTV.mas_bottom).offset(16);
    }];
    [self.mailboxTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mailboxLab.mas_left);
        make.top.equalTo(self.mailboxLab.mas_bottom).offset(6);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.offset(45);
    }];
    [self.callLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mailboxTF.mas_left);
        make.top.equalTo(self.mailboxTF.mas_bottom).offset(16);
    }];
    [self.callTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.callLab.mas_left);
        make.top.equalTo(self.callLab.mas_bottom).offset(6);
        make.right.equalTo(self.view.mas_right).offset(-16);
        make.height.offset(45);
    }];
}
#pragma mark -UITextFieldDelegate

#pragma mark -UITextViewDelegate

- (void)textViewDidEndEditing:(UITextView *)textView{
    
}
#pragma mark -getter
- (UILabel *)suggestLab{
    if (!_suggestLab) {
        _suggestLab = [[UILabel alloc] init];
        _suggestLab.text = @"您对迎新软件的意见或建议（必填）";
        _suggestLab.font = WNFontWithPFRegularForSize(16.0f);
    }
    return _suggestLab;
}
- (UITextView *)suggestTV{
    if (!_suggestTV) {
        _suggestTV = [[UITextView alloc] init];
        _suggestTV.backgroundColor = SXRGB16Color(0xF3F3F3);
        _suggestTV.delegate = self;
    }
    return _suggestTV;
}
- (UILabel *)mailboxLab{
    if (!_mailboxLab) {
        _mailboxLab = [[UILabel alloc] init];
        _mailboxLab.text = @"您的邮箱（选填）";
        _mailboxLab.font = WNFontWithPFRegularForSize(16.0f);
    }
    return _mailboxLab;
}
- (UITextField *)mailboxTF{
    if (!_mailboxTF) {
        _mailboxTF = [[UITextField alloc] init];
        _mailboxTF.delegate = self;
        _mailboxTF.backgroundColor = SXRGB16Color(0xF3F3F3);
    }
    return _mailboxTF;
}
- (UILabel *)callLab{
    if (!_callLab) {
        _callLab = [[UILabel alloc] init];
        _callLab.text = @"您的称呼（选填）";
        _callLab.font = WNFontWithPFRegularForSize(16.0f);
    }
    return _callLab;
}
- (UITextField *)callTF{
    if (!_callTF) {
        _callTF = [[UITextField alloc] init];
        _callTF.delegate = self;
        _callTF.backgroundColor = SXRGB16Color(0xF3F3F3);
    }
    return _callTF;
}
@end
