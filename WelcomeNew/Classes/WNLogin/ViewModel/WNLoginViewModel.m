//
//  WNLoginViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/8.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNLoginViewModel.h"

@implementation WNLoginViewModel
-(void)loadLoginDataWithAccoutn:(NSString *)account withPassword:(NSString *)password success:(void(^)(WNLoginModel *model))success{
    [WNLoginModel loadLoginData:^(NSArray * _Nonnull response) {
        if (response) {
            setWNLoginModel(response);
        }
        NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNLoginModel class] json:response];
        if (success) {
            success(dataArr[0]);
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

@end
