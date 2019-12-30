//
//  BXNetworkTool.h
//  onlineLogistics
//
//  Created by bxkj on 2017/5/5.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import <AFNetworking/AFNetworking.h>
#import <AFNetworking.h>

// 请求方式枚举
typedef NS_ENUM(NSUInteger, NetworkMethod) {
    GET,
    POST
};
@interface WNNetworkTool : AFHTTPSessionManager
//全局访问点
+ (instancetype) shared;
- (void)requestMethod:(NetworkMethod )method urlString:(NSString *)urlString parameters:(id) parameters success:(void (^)(id responseObject))success failure:(void (^)(NSError *error))failure;
@end
