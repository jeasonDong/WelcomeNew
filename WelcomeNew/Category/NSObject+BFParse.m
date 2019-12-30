//
//  NSObject+BFParse.m
//  codePackage
//
//  Created by bxkj on 2017/7/14.
//  Copyright © 2017年 周冰烽. All rights reserved.
//

#import "NSObject+BFParse.h"

@implementation NSObject (BFParse)
+(id)parseJSON:(id)json{
    if ([json isKindOfClass:[NSArray class]]) {
        return [NSArray yy_modelArrayWithClass:[self class] json:json];
    }
    return [self yy_modelWithJSON:json];
}
@end
