//
//  WNAVPlayerControlView.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/14.
//  Copyright © 2019 dix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WNAVPlayerSilder.h"
NS_ASSUME_NONNULL_BEGIN

@interface WNAVPlayerControlView : UIView
@property (nonatomic, strong) UILabel *timeLabel;
@property (nonatomic, strong) UIButton *playButton;
@property (nonatomic, strong) UIButton *pauseButton;
@property (nonatomic, strong) UIButton *fullScreenButton;
@property (nonatomic, strong) UIButton *shrinkScreenButton;
@property (nonatomic, strong) WNAVPlayerSilder *playerSilder;

@property (nonatomic, strong) UIView *bottomView;

// 是否锁屏
@property (nonatomic, assign) BOOL isLock;
// 菜单是否显示
@property (nonatomic, assign) BOOL menuShow;
@end

NS_ASSUME_NONNULL_END
