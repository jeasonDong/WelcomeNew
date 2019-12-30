//
//  WNMineView.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNLoginModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^mineViewRemoveBlock)();
@interface WNMineView : UIView
//移除界面block
@property (nonatomic, copy) mineViewRemoveBlock removeBlock;
@property (nonatomic, strong) WNLoginModel *model;
@property (nonatomic, strong) UINavigationController *navigationController;
@end

NS_ASSUME_NONNULL_END
