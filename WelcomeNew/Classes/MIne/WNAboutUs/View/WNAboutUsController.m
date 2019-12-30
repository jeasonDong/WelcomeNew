//
//  WNAboutUsController.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/19.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNAboutUsController.h"

@interface WNAboutUsController ()
@property (nonatomic, strong) UIImageView *iconIMGV;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *versionLab;
@property (nonatomic, strong) UILabel *introduceLab;
@end

@implementation WNAboutUsController
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
    self.titleText = @"关于我们";
    self.titleColor = [UIColor blackColor];
}
- (void)setUpUIs{
    [self.view addSubview:self.iconIMGV];
    [self.view addSubview:self.nameLab];
    [self.view addSubview:self.versionLab];
    [self.view addSubview:self.introduceLab];
    [self.iconIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.view.mas_centerX).offset(0);
        make.top.equalTo(self.titleView.mas_bottom).offset(96);
        make.width.height.offset(96);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.iconIMGV.mas_centerX).offset(0);
        make.top.equalTo(self.iconIMGV.mas_bottom).offset(23);
    }];
    [self.versionLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.nameLab.mas_centerX).offset(0);
        make.top.equalTo(self.nameLab.mas_bottom).offset(16);
    }];
    [self.introduceLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.versionLab.mas_centerX).offset(0);
        make.bottom.equalTo(self.view.mas_bottom).offset(-33);
    }];
}
#pragma mark -getter
-(UIImageView *)iconIMGV{
    if (!_iconIMGV) {
        _iconIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"icon-60"]];
    }
    return _iconIMGV;
}
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.text = @"迎新";
        _nameLab.font = WNFontWithPFRegularForSize(18.0f);
        _nameLab.textColor = SXRGB16Color(0x222222);
    }
    return _nameLab;
}
- (UILabel *)versionLab{
    if (!_versionLab) {
        _versionLab = [[UILabel alloc] init];
        _versionLab.text = @"1.0.0";
        _versionLab.font = WNFontWithPFRegularForSize(12.0f);
        _versionLab.textColor = SXRGB16Color(0x222222);
    }
    return _versionLab;
}
- (UILabel *)introduceLab{
    if (!_introduceLab) {
        _introduceLab = [[UILabel alloc] init];
        _introduceLab.text = @"Copyright ©2019西南大学 All Rights Reserved";
        _introduceLab.font = WNFontWithPFRegularForSize(11.0f);
        _introduceLab.textColor = SXRGB16Color(0xCCCCCC);
    }
    return _introduceLab;
}
@end
