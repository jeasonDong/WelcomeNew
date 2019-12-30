//
//  BXNetworkTool.m
//  onlineLogistics
//
//  Created by bxkj on 2017/5/5.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import "WNNetworkTool.h"
@interface WNNetworkTool ()

@end
@implementation WNNetworkTool

+ (instancetype)shared{
    static WNNetworkTool *instance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
        instance.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/json", @"text/javascript", @"text/html", @"text/plain", nil];
        
        instance.requestSerializer = [AFJSONRequestSerializer serializer];
        instance.responseSerializer = [AFHTTPResponseSerializer serializer];
    });

    return instance;
}
- (void)requestMethod:(NetworkMethod)method urlString:(NSString *)urlString parameters:(id)parameters success:(void (^)(id))success failure:(void (^)(NSError *))failure{
    if (method == GET) {
        [self GET:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            id rueslt = [NSJSONSerialization JSONObjectWithData:responseObject options:0 error:nil];
            success(rueslt);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
    }else {
        [self POST:urlString parameters:parameters progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
            id rueslt = [[NSString alloc] initWithData:responseObject encoding:NSUTF8StringEncoding];
            success(rueslt);
        } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
            failure(error);
        }];
        
    }
}

@end
