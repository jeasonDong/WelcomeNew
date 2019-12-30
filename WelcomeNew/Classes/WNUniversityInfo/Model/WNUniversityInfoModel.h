//
//  WNUniversityInfoModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNUniversityInfoModel : NSObject
//视频地址
@property (nonatomic, strong) NSString *AVAddressURL;
//学校名称
@property (nonatomic, strong) NSString *universityName;
//点赞数量
@property (nonatomic, strong) NSString *likeNumber;
//学校图标
@property (nonatomic, strong) NSString *universityIcon;
//简介标题
@property (nonatomic, strong) NSString *universityTitle;
//学校简介
@property (nonatomic, strong) NSString *universityIntroduce;
/// 获取学校详情数据
/// @param success 成功的回调
/// @param failed 失败的回调
+(void)loadUniversityInfoDataWithUniversityName:(NSString *)universityName success:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
@end

NS_ASSUME_NONNULL_END
