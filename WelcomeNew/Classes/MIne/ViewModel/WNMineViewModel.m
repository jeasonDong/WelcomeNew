//
//  WNMineViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNMineViewModel.h"
#import "WNLoginoutModel.h"
@implementation WNMineViewModel
- (void)logoutBtnAction{
    [WNLoginoutModel loadLogoutData:^(NSArray * _Nonnull response) {
        setWNLoginModel(@[]);
        WeakSelf(self)
        if (weakself.logoutActionBlock) {
            weakself.logoutActionBlock();
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}
@end
