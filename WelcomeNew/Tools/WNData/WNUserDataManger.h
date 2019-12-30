//
//  WNUserDataManger.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/30.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WNLoginModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WNUserDataManger : NSObject
//获取登录信息
FOUNDATION_EXPORT WNLoginModel *getWNLoginModel();
//保存登录信息
FOUNDATION_EXPORT void setWNLoginModel(NSArray *dataArr);
//判断是否已经登录
FOUNDATION_EXPORT BOOL isLogin(void);
//保存历史记录
FOUNDATION_EXPORT void setHistoryInfo(NSString *name);
//删除记录
FOUNDATION_EXPORT void deleteHistoryInfo(NSUInteger index);
//获取记录信息
FOUNDATION_EXPORT NSArray *getHistoryInfo();
@end

NS_ASSUME_NONNULL_END
