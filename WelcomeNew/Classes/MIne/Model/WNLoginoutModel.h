//
//  WNLoginoutModel.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/9.
//  Copyright © 2019 dix. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface WNLoginoutModel : NSObject
+(void)loadLogoutData:(void(^)(NSArray *response))success failed:(void(^)(NSError *error))failed;
@end

NS_ASSUME_NONNULL_END
