//
//  WNNavigationController.m
//  WelcomeNew
//
//  Created by dix on 2019/9/23.
//  Copyright © 2019年 dix. All rights reserved.
//

#import "WNNavigationController.h"

@interface WNNavigationController ()

@end

@implementation WNNavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.navigationBar setBackgroundImage:[UIImage new] forBarMetrics:UIBarMetricsDefault];
    [self.navigationBar setShadowImage:[[UIImage alloc] init]];
    
    //设置返回按钮的颜色 (左边 右边 按钮)
    self.navigationBar.tintColor = [UIColor blackColor];
    //设置标题颜色
    self.navigationBar.titleTextAttributes = @{NSFontAttributeName : [UIFont systemFontOfSize:16], NSForegroundColorAttributeName : [UIColor blackColor]};
}



@end
