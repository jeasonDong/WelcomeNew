//
//  WNSearchViewModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/26.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef void (^textSearchSchoolDataBlock)(NSArray *dataArr);
@interface WNSearchViewModel : NSObject
//后台返回搜索数据
@property (nonatomic, copy) textSearchSchoolDataBlock schoolDataBlock;
/// 获取搜索数据
-(void)loadSearchDataWithText:(NSString *)text;
/// 用户点击去导航按钮
/// @param universityName 大学名称
- (void)goNavigationBtnAction:(NSString *)universityName;

@end

NS_ASSUME_NONNULL_END
