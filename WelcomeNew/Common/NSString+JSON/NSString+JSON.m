//
//  NSString+JSON.m
//  ElectromechanicalHome
//
//  Created by bxkj on 2017/7/24.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import "NSString+JSON.h"

@implementation NSString (JSON)
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString{
    NSData *JSONData = [JSONString dataUsingEncoding:NSUTF8StringEncoding];
    NSDictionary *responseJSON = [NSJSONSerialization JSONObjectWithData:JSONData options:NSJSONReadingMutableLeaves error:nil];
    return responseJSON;
}
@end
