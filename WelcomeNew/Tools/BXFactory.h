//
//  BXFactory.h
//  ElectromechanicalHome
//
//  Created by bxkj on 2017/8/14.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BXFactory : NSObject
/** 返回数组的count为label的行数,数组的每组数据是每行的text */
+ (NSArray *)getLinesArrayOfStringInLabel:(UILabel *)label;
+ (NSDictionary *) entityToDictionary:(id)entity;

@end
