//
//  WNSearchViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNSearchViewModel.h"
#import "WNSearchModel.h"
@implementation WNSearchViewModel
-(void)loadSearchDataWithText:(NSString *)text{
    [WNSearchModel loadSearchDataWithText:text success:^(NSArray * _Nonnull response) {
        NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNSearchModel class] json:response];
        if (self.schoolDataBlock) {
            self.schoolDataBlock(dataArr);
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}
@end
