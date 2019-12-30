//
//  UIAlertController+Addition.h
//  ElectromechanicalHome
//
//  Created by dix on 2017/7/29.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIAlertController (Addition)
+ (instancetype)showTarget:(UIViewController *)target Alert:(NSString *)message duration:(NSTimeInterval)time;
- (void)addActions:(NSArray<UIAlertAction *> *)actions;
@end
