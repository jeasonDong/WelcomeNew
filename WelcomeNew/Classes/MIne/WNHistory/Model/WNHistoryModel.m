//
//  WNHistoryModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/12/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNHistoryModel.h"

@implementation WNHistoryModel
+(void)loadHistoryDataWithuniversityData:(NSArray *)universityData success:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed{
    NSArray *dataArr = [WNHistoryModel getHistoryData:universityData];
    if (success) {
        success(dataArr);
    }
}
+ (NSArray *)getHistoryData:(NSArray *)data{
    NSArray *dataArr = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"WNXNUniversity",@"universityIcon",@"西南大学",@"universityName",@"“211工程”、“985工程”、“双一流”世界一流学科建设高校",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNQHUniversity",@"universityIcon",@"清华大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学和一流学科“",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNBDUniversity",@"universityIcon",@"北京大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学和一流学科“",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNZJUniversity",@"universityIcon",@"浙江大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学和一流学科“",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNFDUniversity",@"universityIcon",@"复旦大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学“、“世界一流大学建筑高校A类”",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNKJUniversity",@"universityIcon",@"中国科技大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学建筑高校A类”",@"universityIntroduce", nil], nil];
    NSMutableArray *schoolArr = [[NSMutableArray alloc] init];
    for (NSString *name in data) {
        for (NSDictionary *dict in dataArr) {
            NSString *universityName = [dict objectForKey:@"universityName"];
            if ([universityName containsString:name]) {
                [schoolArr addObject:dict];
            }
        }
    }
    return schoolArr.copy;
}
@end
