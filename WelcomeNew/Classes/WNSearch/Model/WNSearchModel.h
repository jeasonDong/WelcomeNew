//
//  WNSearchModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNSearchModel : NSObject
//大学名称
@property (nonatomic, strong) NSString *name;
//学校图标
@property (nonatomic, strong) NSString *icon;
/// 获取搜索数据
/// @param success 成功的回调
/// @param failed 失败的回调
+(void)loadSearchDataWithText:(NSString *)text success:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
@end

NS_ASSUME_NONNULL_END
