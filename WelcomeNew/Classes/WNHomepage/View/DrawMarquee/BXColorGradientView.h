//
//  BXColorGradientView.h
//  ElectromechanicalHome
//
//  Created by bxkj on 2017/7/13.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef NS_ENUM(NSInteger, BXGradientDirection) {
    BXGradientToTop    = 1,
    BXGradientToLeft   = 2,
    BXGradientToBottom = 3,
    BXGradientToRight  = 4,
};
@interface BXColorGradientView : UIView
+ (instancetype)createWithColor:(UIColor *)color frame:(CGRect)frame direction:(BXGradientDirection)direction;

+ (instancetype)createWithFromColor:(UIColor *)fromColor toColor:(UIColor *)toColor frame:(CGRect)frame direction:(BXGradientDirection)direction;

+ (instancetype)createWithColorArray:(NSArray *)colorArray frame:(CGRect)frame direction:(BXGradientDirection)direction;
@end
