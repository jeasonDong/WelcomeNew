//
//  WNHomepageViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WNHomepageModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WNHomepageViewModel : NSObject
/// 获取学校列表数据
/// @param success 成功的回调
-(void)loadHomepageData:(void(^)(NSArray *response))success;
/// 点击首页定位按钮跳转搜索模块
/// @param navigationController 导航栏控制器
-(void)locationBtnActionWithNavigationController:(UINavigationController *)navigationController;

@end

NS_ASSUME_NONNULL_END
