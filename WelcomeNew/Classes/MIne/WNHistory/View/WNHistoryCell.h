//
//  WNHistoryCell.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/12/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNHistoryModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^loactionButtonActionBlock)(WNHistoryModel *model);
@interface WNHistoryCell : UITableViewCell
@property (nonatomic, strong) WNHistoryModel *model;
@property (nonatomic, copy) loactionButtonActionBlock locatinButtonblock;
@end

NS_ASSUME_NONNULL_END
