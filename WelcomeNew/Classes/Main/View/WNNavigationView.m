//
//  WNNavigationView.m
//  WelcomeNew
//
//  Created by dix on 2019/9/22.
//  Copyright © 2019年 dix. All rights reserved.
//

#import "WNNavigationView.h"
@interface WNNavigationView ()
@property (nonatomic, strong) UIView *leftGestureTap;
@end
@implementation WNNavigationView

- (instancetype)init{
    self = [super init];
    if (self) {
        
        [self setUpUI];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUI];
    }
    return self;
}
- (void)setUpUI{
    
    [self addSubview:self.imageview];
    [self.imageview addSubview:self.leftBtn];
    [self.imageview addSubview:self.leftGestureTap];
    [self.imageview addSubview:self.titleLabel];
    [self.imageview addSubview:self.rightBtn];
    [self.imageview addSubview:self.lineView];
    [self bringSubviewToFront:self.leftGestureTap];
    
    [self.imageview mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
    [self.leftBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageview.mas_left).offset(18);
        make.bottom.equalTo(self.imageview.mas_bottom).offset(-13);
    }];
    [self.leftGestureTap mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.imageview.mas_left);
        make.bottom.equalTo(self.imageview.mas_bottom).offset(-1);
        make.width.height.offset(60);
    }];
    
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.imageview.mas_centerX).offset(0);
        make.centerY.equalTo(self.leftBtn.mas_centerY).offset(0);
    }];
    [self.rightBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.imageview.mas_right).offset(-16);
        make.centerY.equalTo(self.leftBtn.mas_centerY).offset(0);
        make.height.width.offset(30);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.bottom.right.mas_equalTo(self.imageview);
        make.height.offset(0.5);
    }];
}


-(void)touchesLeftGestureTap{
    [self.target.navigationController popViewControllerAnimated:YES];
}

- (void)rightBtnWithClick{
    if (self.rightBlock) {
        self.rightBlock();
    }
}
#pragma mark -setter
- (void)setTarget:(UIViewController *)target{
    _target = target;
}
#pragma mark -getter
-(UIImageView *)imageview{
    if (!_imageview) {
        _imageview = [[UIImageView alloc] init];
        _imageview.userInteractionEnabled = YES;
        _imageview.image = [UIImage imageNamed:@"Rectangletopico"];
    }
    return _imageview;
}
- (UIButton *)leftBtn{
    if (!_leftBtn) {
        _leftBtn = [[UIButton alloc] init];
        [_leftBtn setImage:[UIImage imageNamed:@"WNNavbarbackbg"] forState:UIControlStateNormal];
        [_leftBtn setImage:[UIImage imageNamed:@"WNNavbarbackbg"] forState:UIControlStateHighlighted];
        _leftBtn.userInteractionEnabled = YES;
        
    }
    return _leftBtn;
}
- (UILabel *)titleLabel{
    if (!_titleLabel) {
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.text = @"样本详情";
        _titleLabel.font = [UIFont systemFontOfSize:18.0];
        _titleLabel.textColor = [UIColor whiteColor];
    }
    return _titleLabel;
}
-(UIButton *)rightBtn{
    if (!_rightBtn) {
        _rightBtn = [[UIButton alloc] init];
        _rightBtn.titleLabel.font = [UIFont systemFontOfSize:14.0f];
        [_rightBtn setImage:[UIImage imageNamed:@"Group 2withicon"] forState:UIControlStateNormal];
        [_rightBtn setImage:[UIImage imageNamed:@"Group 2withicon"] forState:UIControlStateHighlighted];
        [_rightBtn addTarget:self action:@selector(rightBtnWithClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _rightBtn;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SXRGB16Color(0xF3F3F3);
    }
    return _lineView;
}
- (UIView *)leftGestureTap{
    if (!_leftGestureTap) {
        _leftGestureTap = [[UIView alloc] init];
        _leftGestureTap.backgroundColor = [UIColor clearColor];
        _leftGestureTap.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesLeftGestureTap)];
        [_leftGestureTap addGestureRecognizer:tap];
    }
    return _leftGestureTap;
}
@end
