//
//  WNHistoryViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/12/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "WNHistoryModel.h"
NS_ASSUME_NONNULL_BEGIN
typedef void (^historySchoolDataBlock)(NSArray *dataArr);
@interface WNHistoryViewModel : NSObject
//后台返回搜索数据
@property (nonatomic, copy) historySchoolDataBlock historyDataBlock;
/// 获取搜索数据
-(void)loadHistoryDataWithData:(NSArray *)dataArr;

@end

NS_ASSUME_NONNULL_END
