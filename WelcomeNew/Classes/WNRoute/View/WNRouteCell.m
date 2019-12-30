//
//  WNRouteCell.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/5.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNRouteCell.h"
@interface WNRouteCell ()
@property (nonatomic, strong) UIView *spotView;
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *originLab;
@property (nonatomic, strong) UILabel *trafficLab;
@property (nonatomic, strong) UIImageView *trafficIMGV;
@property (nonatomic, strong) UILabel *finishLab;
@end
@implementation WNRouteCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView{
    [self addSubview:self.spotView];
    [self addSubview:self.lineView];
    [self addSubview:self.originLab];
    [self addSubview:self.trafficLab];
    [self addSubview:self.trafficIMGV];
    [self addSubview:self.finishLab];
    CGSize size=[self.trafficLab.text sizeWithAttributes:@{NSFontAttributeName: WNFontWithPFRegularForSize(12.0f)}];
    [self.spotView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.mas_top);
        make.left.equalTo(self.mas_left).offset(20);
        make.height.width.offset(16);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(self.spotView.mas_centerX).offset(0);
        make.top.equalTo(self.spotView.mas_bottom);
        make.bottom.equalTo(self.mas_bottom);
        make.width.offset(1.5);
    }];
    [self.originLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.spotView.mas_right).offset(18);
        make.centerY.equalTo(self.spotView.mas_centerY).offset(0);
        make.width.offset(210);
    }];
    [self.trafficLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.originLab.mas_left);
        make.top.equalTo(self.originLab.mas_bottom).offset(7);
        make.width.offset(size.width);
    }];
    [self.trafficIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.trafficLab.mas_centerY).offset(0);
        make.left.equalTo(self.trafficLab.mas_right).offset(2);
    }];
    [self.finishLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.trafficLab.mas_bottom).offset(7);
        make.left.equalTo(self.trafficLab.mas_left);
        make.bottom.equalTo(self.mas_bottom).offset(-19);
        make.width.offset(210);
    }];
}
#pragma mark -setter
- (void)setModel:(WNRouteModel *)model{
    _model = model;
    if (model.isFirst) {
        self.spotView.backgroundColor = SXRGB16Color(0x4B77F3);
        self.spotView.layer.cornerRadius = 8.0f;
        [self.spotView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.width.offset(16);
        }];
    }else{
        self.spotView.backgroundColor = SXRGB16Color(0xBBCDFF);
        self.spotView.layer.cornerRadius = 6.0f;
        [self.spotView mas_updateConstraints:^(MASConstraintMaker *make) {
            make.height.width.offset(12);
        }];
    }
    if (model.isFirst || model.isLast) {
        self.originLab.font = WNFontWithPFSemiboldForSize(14.0f);
    }else{
        self.originLab.font = WNFontWithPFRegularForSize(14.0f);
    }
    if (model.isLast) {
        self.lineView.hidden = YES;
        self.trafficLab.hidden = YES;
        self.trafficIMGV.hidden = YES;
        self.finishLab.hidden = YES;
    }else{
        self.lineView.hidden = NO;
        self.trafficLab.hidden = NO;
        self.trafficIMGV.hidden = NO;
        self.finishLab.hidden = NO;
    }
    self.originLab.text = model.origin;
    self.trafficLab.text = model.traffic;
    self.trafficIMGV.image = [UIImage imageNamed:model.trafficName];
    self.finishLab.text = model.distance;
    CGSize size=[model.traffic sizeWithAttributes:@{NSFontAttributeName: WNFontWithPFRegularForSize(12.0f)}];
    size.width = size.width > 250 ? 250 : size.width + 3;
    [self.trafficLab mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.offset(size.width);
    }];
    
}
#pragma mark -getter
- (UIView *)spotView{
    if (!_spotView) {
        _spotView = [[UIView alloc] init];
        _spotView.backgroundColor = SXRGB16Color(0x4B77F3);
        _spotView.layer.cornerRadius = 8.0f;
    }
    return _spotView;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SXRGB16Color(0xDBE4FF);
    }
    return _lineView;
}
- (UILabel *)originLab{
    if (!_originLab) {
        _originLab = [[UILabel alloc] init];
        _originLab.text = @"起点：杭州火车站";
        _originLab.textAlignment = NSTextAlignmentLeft;
        _originLab.font = WNFontWithPFSemiboldForSize(14.0f);
        _originLab.textColor = SXRGB16Color(0x333333);
    }
    return _originLab;
}
- (UILabel *)trafficLab{
    if (!_trafficLab) {
        _trafficLab = [[UILabel alloc] init];
        _trafficLab.text = @"乘坐火车，车次：G4539";
        _trafficLab.textAlignment = NSTextAlignmentLeft;
        _trafficLab.font = WNFontWithPFRegularForSize(12.0f);
        _trafficLab.textColor = SXRGB16Color(0x888888);
    }
    return _trafficLab;
}
-(UIImageView *)trafficIMGV{
    if (!_trafficIMGV) {
        _trafficIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNTrain"]];
    }
    return _trafficIMGV;
}
- (UILabel *)finishLab{
    if (!_finishLab) {
        _finishLab = [[UILabel alloc] init];
        _finishLab.text = @"路程300KM（大约需要2小时）";
        _finishLab.textAlignment = NSTextAlignmentLeft;
        _finishLab.font = WNFontWithPFRegularForSize(12.0f);
        _finishLab.textColor = SXRGB16Color(0x888888);
    }
    return _finishLab;
}
@end
