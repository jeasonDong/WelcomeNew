//
//  WNHistoryCell.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/12/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNHistoryCell.h"
@interface WNHistoryCell ()
@property (nonatomic, strong) UIImageView *iconIMGV;
@property (nonatomic, strong) UILabel *nameLab;
@property (nonatomic, strong) UILabel *synopsisLab;
@property (nonatomic, strong) UIButton *locationBtn;
@property (nonatomic, strong) UIView *lineView;
@end
@implementation WNHistoryCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView{
    [self addSubview:self.iconIMGV];
    [self addSubview:self.nameLab];
    [self addSubview:self.synopsisLab];
    [self addSubview:self.locationBtn];
    [self addSubview:self.lineView];
    [self.iconIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(18);
        make.top.equalTo(self.mas_top).offset(19);
        make.width.height.offset(61);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.iconIMGV.mas_right).offset(19);
        make.top.equalTo(self.mas_top).offset(21);
        make.width.offset(200);
    }];
    [self.synopsisLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_left);
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
        make.height.offset(36);
        make.width.offset(200);
    }];
    [self.locationBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.equalTo(self.mas_right).offset(-15);
        make.centerY.equalTo(self.mas_centerY).offset(0);
        make.width.offset(24);
        make.height.offset(28);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(self);
        make.left.equalTo(self.mas_left).offset(18);
        make.height.offset(1);
    }];
}
#pragma mark -locationBtnAction
- (void)locationBtnAction{
    if (self.locatinButtonblock) {
        self.locatinButtonblock(self.model);
    }
}
#pragma mark -setter
- (void)setModel:(WNHistoryModel *)model{
    _model = model;
    self.iconIMGV.image = [UIImage imageNamed:model.universityIcon];
    self.nameLab.text = model.universityName;
    self.synopsisLab.text = model.universityIntroduce;
}

#pragma mark -getter
- (UIImageView *)iconIMGV{
    if (!_iconIMGV) {
        _iconIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNDefaultImageView"]];
    }
    return _iconIMGV;
}
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.text = @"-.- 大学";
        _nameLab.font = WNFontWithPFMediumForSize(16.0f);
        _nameLab.textColor = SXRGB16Color(0x222222);
    }
    return _nameLab;
}
- (UILabel *)synopsisLab{
    if (!_synopsisLab) {
        _synopsisLab = [[UILabel alloc] init];
        _synopsisLab.text = @"“-.-”、“-.-”、“-.-“";
        _synopsisLab.font = WNFontWithPFMediumForSize(12.0f);
        _synopsisLab.textColor = SXRGB16Color(0x999999);
        _synopsisLab.numberOfLines = 2;
    }
    return _synopsisLab;
}
- (UIButton *)locationBtn{
    if (!_locationBtn) {
        _locationBtn = [[UIButton alloc] init];
        [_locationBtn setImage:[UIImage imageNamed:@"WNLocationImage"] forState:UIControlStateNormal];
        [_locationBtn setImage:[UIImage imageNamed:@"WNLocationImage"] forState:UIControlStateHighlighted];
         [_locationBtn addTarget:self action:@selector(locationBtnAction) forControlEvents:UIControlEventTouchUpInside];
        
    }
    return _locationBtn;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SXRGB16Color(0xF3F3F3);
    }
    return _lineView;
}

@end
