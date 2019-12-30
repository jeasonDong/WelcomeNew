//
//  WNLoginModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/8.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNLoginModel.h"

@implementation WNLoginModel
+(void)loadLoginData:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed{
    NSArray *dataArr = [WNLoginModel getLoginData];
    if (success) {
        success(dataArr);
    }
}
+(NSArray *)getLoginData{
    return [NSArray arrayWithObjects:[NSDictionary dictionaryWithObjectsAndKeys:@"莱布尼茨",@"name",@"mine_iconImage",@"imageIcon",@"66666666",@"ID", nil], nil];
}
@end
