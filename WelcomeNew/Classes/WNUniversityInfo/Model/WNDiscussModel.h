//
//  WNDiscussModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNDiscussModel : NSObject
//评论内容
@property (nonatomic, strong) NSString *content;
//用户头像
@property (nonatomic, strong) NSString *iconURL;
//用户名称
@property (nonatomic, strong) NSString *name;
/// 获取用户评论数据
/// @param success 成功的回调
/// @param failed 失败的回调
+(void)loadDiscussData:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
@end

NS_ASSUME_NONNULL_END
