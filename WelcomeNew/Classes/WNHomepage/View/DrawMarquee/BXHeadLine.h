//
//  BXHeadLine.h
//  ElectromechanicalHome
//
//  Created by bxkj on 2017/7/13.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^actionBlock)(NSInteger index);
@interface BXHeadLine : UIView
@property (nonatomic,strong) NSArray         *messageArray;

@property (nonatomic,strong) UIColor         *textColor;

@property (nonatomic,strong) UIFont          *textFont;

@property (nonatomic,strong) UIColor         *bgColor;

@property (nonatomic,assign) CGFloat          cornerRadius;

@property (nonatomic,assign) BOOL             hasGradient;

@property (nonatomic,assign) NSTimeInterval   scrollDuration;

@property (nonatomic,assign) NSTimeInterval   stayDuration;

- (void)setBgColor:(UIColor *)bgColor textColor:(UIColor *)textColor textFont:(UIFont *)textFont;

- (void)setScrollDuration:(NSTimeInterval)scrollDuration stayDuration:(NSTimeInterval)stayDuration;


- (void)changeTapMarqueeAction:(actionBlock)action;


- (void)start;

- (void)stop;

@end
