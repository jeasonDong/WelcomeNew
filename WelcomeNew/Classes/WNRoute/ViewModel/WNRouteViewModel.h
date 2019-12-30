//
//  WNRouteViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/5.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^loadRouteDataBlock)(NSArray *dataArr);
@interface WNRouteViewModel : NSObject
//后台返回搜索数据
@property (nonatomic, copy) loadRouteDataBlock routeDataBlock;
/// 获取路线数据
/// @param latitude 纬度
/// @param longitude 经度
-(void)loadRouteDataWithLatitude:(NSString *)latitude withLongitude:(NSString *)longitude;
@end

NS_ASSUME_NONNULL_END
