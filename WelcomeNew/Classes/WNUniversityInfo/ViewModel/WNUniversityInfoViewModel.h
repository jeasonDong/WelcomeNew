//
//  WNUniversityInfoViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^searchSchoolInfoBlock)(NSArray *dataArr);
@interface WNUniversityInfoViewModel : NSObject
//后台返回搜索数据
@property (nonatomic, copy) searchSchoolInfoBlock schoolInfoBlock;
/// 获取学校详情数据
/// @param universityName 大学名称
-(void)loadUniversityInfoDataWithUniversityName:(NSString *)universityName;
/// 获取用户评论数据
/// @param success 成功的回调
/// @param failed 失败的回调
-(void)loadDiscussData:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
/// 用户评论
/// @param content 评论内容
- (void)disCussBtnActionWithContent:(NSString *)content;

/// 用户点赞
- (void)likeBtnAction;
@end

NS_ASSUME_NONNULL_END
