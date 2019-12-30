//
//  WNHistoryViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/12/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNHistoryViewModel.h"
@interface WNHistoryViewModel ()

@end
@implementation WNHistoryViewModel
- (instancetype)init{
    self = [super init];
    if (self) {
        
    }
    return self;
}
-(void)loadHistoryDataWithData:(NSArray *)dataArr{
    [WNHistoryModel loadHistoryDataWithuniversityData:dataArr success:^(NSArray * _Nonnull response) {
        NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNHistoryModel class] json:response];
        if (self.historyDataBlock) {
            self.historyDataBlock(dataArr);
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}

@end
