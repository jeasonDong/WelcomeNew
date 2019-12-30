//
//  WNLoginViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/8.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WNLoginModel.h"
NS_ASSUME_NONNULL_BEGIN

@interface WNLoginViewModel : NSObject
-(void)loadLoginDataWithAccoutn:(NSString *)account withPassword:(NSString *)password success:(void(^)(WNLoginModel *model))success;
@end

NS_ASSUME_NONNULL_END
