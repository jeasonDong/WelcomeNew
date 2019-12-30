//
//  WNHomepageCell.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/24.
//  Copyright © 2019 dix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNHomepageModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^loactionBtnActionBlock)(WNHomepageModel *model);
@interface WNHomepageCell : UITableViewCell
@property (nonatomic, strong) WNHomepageModel *model;
@property (nonatomic, copy) loactionBtnActionBlock locatinBtnblock;
@end

NS_ASSUME_NONNULL_END
