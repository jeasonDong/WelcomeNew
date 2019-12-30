//
//  WNSearchCell.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/9.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNSearchCell.h"
@interface WNSearchCell ()
@property (nonatomic, strong) UIView *lineView;
@property (nonatomic, strong) UILabel *nameLab;
@end
@implementation WNSearchCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.backgroundColor = SXRGB16Color(0xF6F7FA);
        [self initSubView];
    }
    return self;
}
- (void)initSubView{
    [self addSubview:self.nameLab];
    [self addSubview:self.lineView];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(12);
        make.top.bottom.mas_equalTo(self);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.right.mas_equalTo(self);
        make.left.equalTo(self.mas_left).offset(18);
        make.height.offset(1);
    }];
}
#pragma mark -setter
- (void)setModel:(WNSearchModel *)model{
    _model = model;
    self.nameLab.text = model.name;
}
#pragma mark -getter
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.numberOfLines = 1;
        _nameLab.text = @"";
    }
    return _nameLab;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SXRGB16Color(0xF3F3F3);
    }
    return _lineView;
}
@end
