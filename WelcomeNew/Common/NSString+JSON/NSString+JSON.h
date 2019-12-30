//
//  NSString+JSON.h
//  ElectromechanicalHome
//
//  Created by bxkj on 2017/7/24.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (JSON)
+ (NSDictionary *)parseJSONStringToNSDictionary:(NSString *)JSONString;
@end
