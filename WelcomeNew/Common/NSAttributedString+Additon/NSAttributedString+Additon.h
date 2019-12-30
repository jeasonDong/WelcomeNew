//
//  NSAttributedString+CZAdditon.h
//  Zhifubao
//
//  Copyright © 2016年 itcast. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NSAttributedString (Additon)

+ (instancetype)imageTextWithImage:(UIImage*)image imageWH:(CGFloat)imageWH title:(NSString*)title fontSize:(CGFloat)fontSize titleColor:(UIColor*)titleColor spacing:(CGFloat)spacing;
@end
