//
//  WNHistoryModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/12/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNHistoryModel : NSObject
//学校图标
@property (nonatomic, strong) NSString *universityIcon;
//学校名称
@property (nonatomic, strong) NSString *universityName;
//学校简介
@property (nonatomic, strong) NSString *universityIntroduce;
/// 获取搜索数据
/// @param success 成功的回调
/// @param failed 失败的回调
+(void)loadHistoryDataWithuniversityData:(NSArray *)universityData success:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
@end

NS_ASSUME_NONNULL_END
