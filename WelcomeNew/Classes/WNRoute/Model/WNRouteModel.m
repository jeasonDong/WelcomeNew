//
//  WNRouteModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNRouteModel.h"

@implementation WNRouteModel
+(void)loadRouteDataWithLatitude:(NSString *)latitude withLongitude:(NSString *)longitude success:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed{
    NSArray *dataArr = [WNRouteModel getRouteData];
    if (success) {
        success(dataArr);
    }
}
+ (NSArray *)getRouteData{
    NSArray *dataArr = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@(YES),@"isFirst",@"",@"isLast",@"起点：杭州天堂软件园",@"origin",@"步行至2号线古翠路地铁站",@"traffic",@"WNWalk",@"trafficName",@"路程732m（大约27分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"2号线地铁站：古翠路",@"origin",@"乘坐地铁2号线（开往朝阳方向）",@"traffic",@"WNMetro",@"trafficName",@"路程5.7km（大约14分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"到达地铁站：凤起路",@"origin",@"换乘1号线（开往临平方向）",@"traffic",@"WNMetro",@"trafficName",@"路程8.6km（大约22分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"到达杭州东站",@"origin",@"乘坐火车，车次：D2246",@"traffic",@"WNTrain",@"trafficName",@"路程1620km（大约11小时40分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"到达重庆北站",@"origin",@"步行至轨道交通10号线",@"traffic",@"WNWalk",@"trafficName",@"路程179m（大约3分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"到达轨道交通10号线",@"origin",@"乘坐轨道交通10号线（开往鲤鱼池方向）",@"traffic",@"WNMetro",@"trafficName",@"路程1km（大约8分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"到达红土地站",@"origin",@"换乘坐轨道交通6号线（开往北培方向）",@"traffic",@"WNMetro",@"trafficName",@"路程13km（大约8分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@"",@"isLast",@"到达天生站",@"origin",@"步行至目的地",@"traffic",@"WNWalk",@"trafficName",@"路程378m（大约6分钟）",@"distance", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"",@"isFirst",@(YES),@"isLast",@"到达终点：西南大学",@"origin",@"",@"traffic",@"",@"trafficName",@"",@"distance", nil], nil];
    return dataArr;
}
@end
