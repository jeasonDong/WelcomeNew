//
//  WNUniversityInfoCell.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/10/14.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNBriefCell.h"
@interface WNBriefCell ()
//学校图标
@property (nonatomic, strong) UIImageView *schoolIconIMGV;
//学校名称
@property (nonatomic, strong) UILabel *nameLab;
//点赞数量
@property (nonatomic, strong) UILabel *likeNumberLab;
//简介标题
@property (nonatomic, strong) UILabel *titleLab;
//学校简介
@property (nonatomic, strong) UILabel *briefLab;
@end
@implementation WNBriefCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self initSubView];
    }
    return self;
}
- (void)initSubView{
    self.backgroundColor = SXRGB16Color(0xF6F7FA);
    [self addSubview:self.schoolIconIMGV];
    [self addSubview:self.nameLab];
    [self addSubview:self.likeNumberLab];
    [self addSubview:self.titleLab];
    [self addSubview:self.briefLab];
    [self.schoolIconIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left).offset(16);
        make.top.equalTo(self.mas_top).offset(16);
        make.height.width.offset(50);
    }];
    [self.nameLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.schoolIconIMGV.mas_top);
        make.left.equalTo(self.schoolIconIMGV.mas_right).offset(12);
        make.right.equalTo(self.mas_right).offset(-16);
        make.height.offset(25);
    }];
    [self.likeNumberLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.nameLab.mas_left);
        make.top.equalTo(self.nameLab.mas_bottom).offset(2);
        make.width.offset(70);
        make.height.offset(20);
    }];
    [self.titleLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.schoolIconIMGV.mas_left);
        make.top.equalTo(self.likeNumberLab.mas_bottom).offset(19);
        make.right.equalTo(self.mas_right).offset(-16);
        make.height.offset(27);
    }];
    [self.briefLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.mas_left);
        make.top.equalTo(self.titleLab.mas_bottom).offset(6);
        make.right.equalTo(self.mas_right);
        make.bottom.equalTo(self.mas_bottom).offset(-16);
    }];

}
#pragma mark -setter
- (void)setModel:(WNUniversityInfoModel *)model{
    _model = model;
    self.schoolIconIMGV.image = [UIImage imageNamed:model.universityIcon];
    self.nameLab.text = model.universityName;
    self.likeNumberLab.text = [NSString stringWithFormat:@"点赞 %@",model.likeNumber];
    self.titleLab.text = model.universityTitle;
    self.briefLab.text = model.universityIntroduce;
}
#pragma mark -getter

- (UIImageView *)schoolIconIMGV{
    if (!_schoolIconIMGV) {
        _schoolIconIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNSchoolZJDXIcon"]];
    }
    return _schoolIconIMGV;
}
- (UILabel *)nameLab{
    if (!_nameLab) {
        _nameLab = [[UILabel alloc] init];
        _nameLab.text = @"浙江大学紫荆港校区";
        _nameLab.textAlignment = NSTextAlignmentLeft;
        _nameLab.font = WNFontWithPFMediumForSize(17.0f);
        _nameLab.textColor = SXRGB16Color(0x222222);
    }
    return _nameLab;
}
- (UILabel *)likeNumberLab{
    if (!_likeNumberLab) {
        _likeNumberLab = [[UILabel alloc] init];
        _likeNumberLab.text = @"点赞 888";
        _likeNumberLab.textAlignment = NSTextAlignmentLeft;
        _likeNumberLab.font = WNFontWithPFRegularForSize(14.0f);
        _likeNumberLab.textColor = SXRGB16Color(0xB2B2B2);
    }
    return _likeNumberLab;
}
- (UILabel *)titleLab{
    if (!_titleLab) {
        _titleLab = [[UILabel alloc] init];
        _titleLab.text = @"浙江大学紫金港校区大一新生报道指南";
        _titleLab.textAlignment = NSTextAlignmentLeft;
        _titleLab.font = WNFontWithPFRegularForSize(19.0f);
        _titleLab.textColor = SXRGB16Color(0x333333);
    }
    return _titleLab;
}
- (UILabel *)briefLab{
    if (!_briefLab) {
        NSString *string = @"    浙江大学（Zhejiang University），简称“浙大”，由中华人民共和国教育部直属，中央直管副部级建制，“211工程”、“985工程”、“世界一流大学和一流学科”，九校联盟（C9）、环太平洋大学联盟、世界大学联盟、国际应用科技开发协作网、中国大学校长联谊会、新工科教育国际联盟、全球能源互联网大学联盟、CDIO工程教育联盟成员，入选基础学科拔尖学生培养试验计划、高等学校创新能力提升计划、高等学校学科创新引智计划、卓越工程师教育培养计划、卓越医生教育培养计划、卓越法律人才教育培养计划、卓越农林人才教育培养计划、中国政府奖学金来华留学生接收院校、国家建设高水平大学公派研究生项目、全国首批深化创新创业教育改革示范高校，为中国人自己最早创办的新式高等学校之一，是一所综合性全国重点大学，曾被英国著名学者李约瑟称誉为“东方剑桥”。\n    学校前身是创立于1897年求是书院，1928年定名国立浙江大学。1937年浙江大学举校西迁，在贵州遵义、湄潭等地办学，1946年秋回迁杭州。1952年，浙江大学部分系科转入中国科学院和其他高校，主体部分在杭州重组为若干所院校，后分别发展为原浙江大学、杭州大学、浙江农业大学和浙江医科大学。1998年，同根同源的四校实现合并，组建了新的浙江大学。\n    在120余年的办学历程中，学校始终秉承“求是创新”为校训的优良传统，逐步形成了“勤学、修德、明辨、笃实”的浙大人共同价值观和“海纳江河、启真厚德、开物前民、树我邦国”的浙大精神。";
        _briefLab = [[UILabel alloc] init];
        _briefLab.text = string;
        _briefLab.numberOfLines = 0;
        _briefLab.font = WNFontWithPFRegularForSize(12.0f);
        _briefLab.textColor = [UIColor blackColor];
        _briefLab.backgroundColor = SXRGB16Color(0xF6F7FA);
    }
    return _briefLab;
}

@end
