//
//  WNUniversityInfoViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNUniversityInfoViewModel.h"
#import "WNUniversityInfoModel.h"
@implementation WNUniversityInfoViewModel
-(void)loadUniversityInfoDataWithUniversityName:(NSString *)universityName{
    [WNUniversityInfoModel loadUniversityInfoDataWithUniversityName:universityName success:^(NSArray * _Nonnull response) {
        NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNUniversityInfoModel class] json:response];
        if (self.schoolInfoBlock) {
            self.schoolInfoBlock(dataArr);
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}
@end
