//
//  WNLoginModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/8.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNLoginModel : NSObject
//名字
@property (nonatomic, strong) NSString *name;
//头像
@property (nonatomic, strong) NSString *imageIcon;
//唯一标示
@property (nonatomic, strong) NSString *ID;

+(void)loadLoginData:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
@end

NS_ASSUME_NONNULL_END
