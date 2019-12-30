//
//  WNUserDataManger.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/30.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNUserDataManger.h"

@implementation WNUserDataManger
FOUNDATION_EXPORT WNLoginModel *getWNLoginModel(){
    NSData *records = [[NSUserDefaults standardUserDefaults] objectForKey:@"WNLoginModel"];
    NSArray *response = [NSKeyedUnarchiver unarchiveObjectWithData:records];
    NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNLoginModel class] json:response];
    WNLoginModel *model = dataArr.count > 0 ? dataArr[0] : nil;
    return model;
}
FOUNDATION_EXPORT void setWNLoginModel(NSArray *dataArr){
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dataArr];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"WNLoginModel"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
FOUNDATION_EXPORT BOOL isLogin(void){
    NSData *records = [[NSUserDefaults standardUserDefaults] objectForKey:@"WNLoginModel"];
    NSArray *dataArr = [NSKeyedUnarchiver unarchiveObjectWithData:records];
    return dataArr.count > 0 ? YES : NO;
}
FOUNDATION_EXPORT void setHistoryInfo(NSString *name){
    NSData *records = [[NSUserDefaults standardUserDefaults] objectForKey:@"WNHistoryInfo"];
    NSArray *response = [NSKeyedUnarchiver unarchiveObjectWithData:records];
    NSMutableArray *responseArrM = response.mutableCopy;
    for (NSString *data in response) {
        if ([name isEqualToString:data]) {
            [responseArrM removeObject:name];
        }
    }
    NSMutableArray *dataArrM = [[NSMutableArray alloc] init];
    [dataArrM addObject:name];
    for (NSString *universityName in responseArrM) {
        [dataArrM addObject:universityName];
    }
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:dataArrM.copy];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"WNHistoryInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
FOUNDATION_EXPORT void deleteHistoryInfo(NSUInteger index){
    NSData *records = [[NSUserDefaults standardUserDefaults] objectForKey:@"WNHistoryInfo"];
    NSArray *response = [NSKeyedUnarchiver unarchiveObjectWithData:records];
    NSMutableArray *responseArrM = response.mutableCopy;
    [responseArrM removeObjectAtIndex:index];
    NSData *data = [NSKeyedArchiver archivedDataWithRootObject:responseArrM.copy];
    [[NSUserDefaults standardUserDefaults] setObject:data forKey:@"WNHistoryInfo"];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
FOUNDATION_EXPORT NSArray *getHistoryInfo(){
    NSData *records = [[NSUserDefaults standardUserDefaults] objectForKey:@"WNHistoryInfo"];
    NSArray *dataArr = [NSKeyedUnarchiver unarchiveObjectWithData:records];
    return dataArr;
}
@end
