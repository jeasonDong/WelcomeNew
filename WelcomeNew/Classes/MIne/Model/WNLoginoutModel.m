//
//  WNLoginoutModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/9.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNLoginoutModel.h"

@implementation WNLoginoutModel
+(void)loadLogoutData:(void(^)(NSArray *response))successBlock failed:(void(^)(NSError *error))failedBlock{
    if (successBlock) {
        successBlock(@[@"success"]);
    }
}
@end
