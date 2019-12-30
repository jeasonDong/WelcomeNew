//
//  BFTimeGet.h
//  codePackage
//
//  Created by bxkj on 2017/7/14.
//  Copyright © 2017年 周冰烽. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BFTimeGet : NSObject

/*
 获取当前时间
 到月:timeType = @"yyyy-MM"
 到天:timeType = @"yyyy-MM-dd"
 到小时:timeType = @"yyyy-MM-dd hh"
 到分:timeType = @"yyyy-MM-dd hh:mm"
 到秒:timeType = @"yyyy-MM-dd hh:mm:ss"
 */
+(NSString *)getTimeDateWithType:(NSString *)timeType;


/**
 根据日期获取礼拜几
 传入时间格式要求yyyy-MM-dd
 */
+(NSString *)weekDayStringFromDate:(NSString *)date;



@end
