//
//  WNBaseViewController.h
//  WelcomeNew
//
//  Created by dix on 2019/9/24.
//  Copyright © 2019年 dix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNNavigationView.h"
@interface WNBaseViewController : UIViewController

@property (nonatomic, strong) WNNavigationView *titleView;
//导航栏的按钮
@property (nonatomic, strong) UIImage *rightImage;
@property (nonatomic, strong) UIImage *leftImage;
@property (nonatomic, strong) UIColor *titleColor;
@property (nonatomic, copy) NSString *titleText;

- (void)setUpUI;
-(void)rightButtonClick;
@end
