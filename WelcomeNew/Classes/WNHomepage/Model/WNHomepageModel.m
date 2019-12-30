//
//  WNHomepageModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNHomepageModel.h"

@implementation WNHomepageModel
+(void)loadHomepageData:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed{
    NSArray *dataArr = [WNHomepageModel getHomepageData];
    if (success) {
        success(dataArr);
    }
}
+ (NSArray *)getHomepageData{
    NSArray *dataArr = [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"WNXNUniversity",@"universityIcon",@"西南大学",@"universityName",@"“211工程”、“985工程”、“双一流”世界一流学科建设高校",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNQHUniversity",@"universityIcon",@"清华大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学和一流学科“",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNBDUniversity",@"universityIcon",@"北京大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学和一流学科“",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNZJUniversity",@"universityIcon",@"浙江大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学和一流学科“",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNFDUniversity",@"universityIcon",@"复旦大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学“、“世界一流大学建筑高校A类”",@"universityIntroduce", nil],[NSDictionary dictionaryWithObjectsAndKeys:@"WNKJUniversity",@"universityIcon",@"中国科技大学",@"universityName",@"“211工程”、“985工程”、“世界一流大学建筑高校A类”",@"universityIntroduce", nil], nil];
    return dataArr;
}
@end
