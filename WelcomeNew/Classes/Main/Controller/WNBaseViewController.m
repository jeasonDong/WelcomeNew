//
//  WNBaseViewController.m
//  WelcomeNew
//
//  Created by bxkj on 2017/6/24.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import "WNBaseViewController.h"
@interface WNBaseViewController ()

@end

@implementation WNBaseViewController


- (void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    [self.view bringSubviewToFront:self.titleView];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setUpUI];
    self.navigationController.navigationBarHidden = YES;
    
}

- (void)setUpUI{
    self.view.backgroundColor = SXRGB16Color(0xF6F7FA);

}
-(void)rightButtonClick{
    
}
#pragma mark -getter
- (WNNavigationView *)titleView{
    if (!_titleView) {
        _titleView = [[WNNavigationView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 64)];
        _titleView.target = self;
        WeakSelf(self);
        _titleView.rightBlock = ^{
            [weakself rightButtonClick];
        };
        [self.view addSubview:_titleView];
    }
    return _titleView;
}
#pragma mark -setter

- (void)setRightImage:(UIImage *)rightImage{
    _rightImage = rightImage;
    [self.titleView.rightBtn setImage:rightImage forState:UIControlStateNormal];
    [self.titleView.rightBtn setImage:rightImage forState:UIControlStateHighlighted];
}
- (void)setLeftImage:(UIImage *)leftImage{
    _leftImage = leftImage;
    [self.titleView.leftBtn setImage:leftImage forState:UIControlStateNormal];
    [self.titleView.leftBtn setImage:leftImage forState:UIControlStateHighlighted];
}
- (void)setTitleText:(NSString *)titleText{
    _titleText = titleText;
    self.titleView.titleLabel.text = titleText;
}
//设置标题颜色
- (void)setTitleColor:(UIColor *)titleColor{
    _titleColor = titleColor;
    self.titleView.titleLabel.textColor = titleColor;
}

@end
