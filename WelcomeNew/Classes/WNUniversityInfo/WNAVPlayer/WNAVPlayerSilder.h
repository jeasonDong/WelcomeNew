//
//  WNAVPlayerSilder.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/14.
//  Copyright © 2019 dix. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^TapChangeValue)(float value);
@interface WNAVPlayerSilder : UIView
@property (nonatomic, strong) UIView *baseView;
@property (nonatomic, strong) UIView *bufferView;
@property (nonatomic, strong) UIView *finishView;
@property (nonatomic, strong) UIImageView *slipImgView;

@property (nonatomic, assign) float bufferValue;
@property (nonatomic, assign) float finishValue;

@property (nonatomic, copy) TapChangeValue tapChangeValue;
@end

NS_ASSUME_NONNULL_END
