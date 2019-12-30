//
//  WNLoginViewController.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/30.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNBaseViewController.h"
#import "WNLoginModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^loginSuccessBlock)(WNLoginModel *model);
@interface WNLoginViewController : WNBaseViewController
@property (nonatomic, copy) loginSuccessBlock successBlock;
@end

NS_ASSUME_NONNULL_END
