//
//  WNRouteModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNRouteModel : NSObject
//是否第一个
@property (nonatomic, assign) BOOL isFirst;
//是否最后一个
@property (nonatomic, assign) BOOL isLast;
//路线
@property (nonatomic, strong) NSString *origin;
//交通
@property (nonatomic, strong) NSString *traffic;
//交通名称
@property (nonatomic, strong) NSString *trafficName;
//路程
@property (nonatomic, strong) NSString *distance;
/// 获取路程数据
/// @param latitude 纬度
/// @param longitude 经度
/// @param success 成功的回调
/// @param failed 失败的回调
+(void)loadRouteDataWithLatitude:(NSString *)latitude withLongitude:(NSString *)longitude success:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;

@end

NS_ASSUME_NONNULL_END
