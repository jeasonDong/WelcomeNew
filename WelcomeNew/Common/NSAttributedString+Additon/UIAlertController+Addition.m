//
//  UIAlertController+Addition.m
//  ElectromechanicalHome
//
//  Created by dix on 2017/7/29.
//  Copyright © 2017年 bxkj. All rights reserved.
//

#import "UIAlertController+Addition.h"

@implementation UIAlertController (Addition)
+ (instancetype)showTarget:(UIViewController *)target Alert:(NSString *)message duration:(NSTimeInterval)time{
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"" message:message preferredStyle:UIAlertControllerStyleAlert];
    //改变message的大小和颜色
    NSMutableAttributedString *messageAtt = [[NSMutableAttributedString alloc] initWithString:message];
    [messageAtt addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:16] range:NSMakeRange(0, message.length)];
    [messageAtt addAttribute:NSForegroundColorAttributeName value:[UIColor darkTextColor] range:NSMakeRange(0, message.length)];
    [alertController setValue:messageAtt forKey:@"attributedMessage"];
    
    [NSTimer scheduledTimerWithTimeInterval:time repeats:YES block:^(NSTimer * _Nonnull timer) {
        [alertController dismissViewControllerAnimated:YES completion:nil];
    }];
    [target presentViewController:alertController animated:YES completion:nil];
    
    return alertController;
}
- (void)addActions:(NSArray<UIAlertAction *> *)actions{
    for (UIAlertAction *action in actions) {
        [self addAction:action];
    }
}

@end
