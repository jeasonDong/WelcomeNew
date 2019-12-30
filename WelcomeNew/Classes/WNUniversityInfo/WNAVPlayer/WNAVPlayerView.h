//
//  WNAVPlayerView.h
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/14.
//  Copyright © 2019 dix. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import "WNAVPlayerControlView.h"
NS_ASSUME_NONNULL_BEGIN

@interface WNAVPlayerView : UIView
@property (nonatomic, strong) AVPlayerItem *playerItem;
@property (nonatomic, strong) AVPlayerLayer *playerLayer;
@property (nonatomic, strong) AVPlayer *avPlayer;

@property (nonatomic, strong) WNAVPlayerControlView *controlView;
// define NO
@property (nonatomic, assign) BOOL isFullScreen;
/*
 初始化传入item 立即播放
 */
- (instancetype)initWithPlayerItem:(AVPlayerItem *)playerItem;
- (void)settingPlayerItemWithUrl:(NSURL *)playerUrl;
- (void)settingPlayerItem:(AVPlayerItem *)playerItem;
@end

NS_ASSUME_NONNULL_END
