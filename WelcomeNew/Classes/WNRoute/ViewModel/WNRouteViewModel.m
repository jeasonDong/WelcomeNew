//
//  WNRouteViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/5.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNRouteViewModel.h"
#import "WNRouteModel.h"
@implementation WNRouteViewModel
-(void)loadRouteDataWithLatitude:(NSString *)latitude withLongitude:(NSString *)longitude{
    [WNRouteModel loadRouteDataWithLatitude:latitude withLongitude:longitude success:^(NSArray * _Nonnull response) {
        NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNRouteModel class] json:response];
        if (self.routeDataBlock) {
            self.routeDataBlock(dataArr);
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}
@end
