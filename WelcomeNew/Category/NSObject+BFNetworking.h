//
//  NSObject+BFNetworking.h
//  codePackage
//
//  Created by bxkj on 2017/7/14.
//  Copyright © 2017年 周冰烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (BFNetworking)

/**
 AF GET请求
 
 @param url 解析网址
 @param parameters 解析参数
 @param downloadProgress 下载进度
 @param completionHandler 完成block
 */
+(id)GET:(NSString *)url parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObject, NSError *error))completionHandler;

/**
 AF POST请求
 
 @param url 解析网址
 @param parameters 解析参数
 @param downloadProgress 下载进度
 @param completionHandler 完成block
 */
+(id)POST:(NSString *)url parameters:(NSDictionary *)parameters progress:(void(^)(NSProgress *))downloadProgress completionHandler:(void (^)(id responseObject, NSError *error))completionHandler;

@end
