//
//  WNMineViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^logoutBtnActionBlock)();

@interface WNMineViewModel : NSObject

@property (nonatomic, copy) logoutBtnActionBlock  logoutActionBlock;
/// 点击历史记录按钮
-(void)historyRecordsBtnAction;

/// 点击关于我们按钮
- (void)aboutUsBtnAction;

/// 点击意见反馈按钮
- (void)contactUsBtnAction;

/// 点击头像登录按钮
- (void)loginBtnAction;

/// 点击退出登录按钮
- (void)logoutBtnAction;

@end

NS_ASSUME_NONNULL_END
