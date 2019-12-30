//
//  WNNavigationView.h
//  WelcomeNew
//
//  Created by dix on 2019/9/22.
//  Copyright © 2019年 dix. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WNNavigationView : UIView
@property (nonatomic, strong) UIViewController *target;
@property (nonatomic, copy) void (^rightBlock)();
@property (nonatomic, strong) UIButton *leftBtn;
@property (nonatomic, strong) UIImageView *imageview;
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UIButton *rightBtn;
@property (nonatomic, strong) UIView *lineView;
@end
