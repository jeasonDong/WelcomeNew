//
//  BFTimeGet.m
//  codePackage
//
//  Created by bxkj on 2017/7/14.
//  Copyright © 2017年 周冰烽. All rights reserved.
//

#import "BFTimeGet.h"

@implementation BFTimeGet


+(NSString *)getTimeDateWithType:(NSString *)timeType{
    NSDate *date = [NSDate date];
    NSTimeInterval interval = [date timeIntervalSinceNow];
    NSDate *timeDate = [[NSDate alloc]initWithTimeIntervalSinceNow:interval];
    NSDateFormatter *dateFormat = [[NSDateFormatter alloc]init];
    [dateFormat setDateFormat:timeType];
    NSString *currentTime = [dateFormat stringFromDate:timeDate];
    return currentTime;
}

+(NSString *)weekDayStringFromDate:(NSString *)date{
    NSArray *weekdays = [NSArray arrayWithObjects: [NSNull null], @"星期日", @"星期一", @"星期二", @"星期三", @"星期四", @"星期五", @"星期六", nil];
    
    NSCalendar *calendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    
    NSTimeZone *timeZone = [[NSTimeZone alloc] initWithName:@"Asia/Shanghai"];
    
    [calendar setTimeZone: timeZone];
    
    NSCalendarUnit calendarUnit = NSCalendarUnitWeekday;
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    
    [dateFormatter setDateFormat:@"yyyy-MM-dd"];
    
    NSDate *inputDate = [dateFormatter dateFromString:date];
    
    NSDateComponents *theComponents = [calendar components:calendarUnit fromDate:inputDate];
    
    return [weekdays objectAtIndex:theComponents.weekday];
}



@end
