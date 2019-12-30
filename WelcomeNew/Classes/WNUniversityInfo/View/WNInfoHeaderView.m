//
//  WNInfoHeaderView.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/14.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNInfoHeaderView.h"
#import "WNAVPlayerView.h"
@interface WNInfoHeaderView ()
@property (nonatomic, strong) WNAVPlayerView *playerView;
@property (nonatomic, strong) UIImageView *playerIMGV;
@end
@implementation WNInfoHeaderView
- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        [self setUpUIs];
    }
    return self;
}
- (void)setUpUIs{
    [self addSubview:self.playerView];
    [self.playerView addSubview:self.playerIMGV];
    [self.playerView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
    [self.playerIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
}
#pragma mark -action
- (void)touchesUpInside{
    [self.playerIMGV removeFromSuperview];
    NSString *moviePath = [[NSBundle mainBundle] pathForResource:@"schoolMovie" ofType:@"mp4"];
    [self.playerView settingPlayerItemWithUrl:[NSURL fileURLWithPath:moviePath]];
}
#pragma mark -getter
- (WNAVPlayerView *)playerView{
    if (!_playerView) {
        _playerView = [[WNAVPlayerView alloc] init];
        
    }
    return _playerView;
}
- (UIImageView *)playerIMGV{
    if (!_playerIMGV) {
        _playerIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNPlayerImageView"]];
        _playerIMGV.userInteractionEnabled = YES;
        UITapGestureRecognizer* tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(touchesUpInside)];
        [_playerIMGV addGestureRecognizer:tap];
    }
    return _playerIMGV;
}
@end
