//
//  WNUniversityInfoController.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNUniversityInfoController.h"
#import "WNUniversityInfoModel.h"
#import "WNUniversityInfoViewModel.h"
#import "WNInfoHeaderView.h"
#import "WNBriefCell.h"
#define headerViewMin_h 212
#define headerViewMax_h 470
#define max_h 258
#define sectionView_h 50

//银证转账按钮状态
typedef NS_ENUM(NSInteger,WNScrollViewType)
{
    WNScrollViewTypeBG            = 111,//背景滚动控件
    WNScrollViewTypeBGBottom      = 222,//底部背景滚动控件
    WNScrollViewTypeBrief         = 333,//简介滚动
    WNScrollViewTypeDiscuss       = 444,//评论滚动
};
@interface WNUniversityInfoController ()<UIScrollViewDelegate,UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) WNUniversityInfoViewModel *viewModel;
//播放视频view
@property (nonatomic, strong) WNInfoHeaderView *headerView;
@property (nonatomic, strong) UIView *sectionView;
//背景滚动控件
@property (nonatomic, strong) UIScrollView *BGScrollView;
//学校简介滚动控件
@property (nonatomic, strong) UIScrollView *scrollView;
//简介tab
@property (nonatomic, strong) UITableView *briefTabV;
//评论tab
@property (nonatomic, strong) UITableView *discussTabV;
//简介
@property (nonatomic, strong) UIButton *briefBtn;
//评论
@property (nonatomic, strong) UIButton *discussBtn;
//下划线
@property (nonatomic, strong) UIView *lineView;
//点赞
@property (nonatomic, strong) UIButton *likeBtn;
//按钮点击标识
@property (nonatomic, assign) BOOL clickFlag;
//学校信息容器
@property (nonatomic, strong) NSArray *schoolInfoData;

@end

@implementation WNUniversityInfoController

- (void)setUpUI{
    self.titleText = @"";
    self.titleView.lineView.hidden = YES;
    self.leftImage = [UIImage imageNamed:@"btn_whiteItem"];
    self.clickFlag = YES;
    setHistoryInfo(self.universityName);
    [super setUpUI];
    [self setUpUIs];
}
- (void)setUpUIs{
    [self.view addSubview:self.BGScrollView];
    [self.BGScrollView mas_makeConstraints:^(MASConstraintMaker *make) {
        [make edges];
    }];
    [self.BGScrollView addSubview:self.headerView];
    [self.BGScrollView addSubview:self.sectionView];
    [self.BGScrollView addSubview:self.scrollView];
    [self.scrollView addSubview:self.briefTabV];
    [self.scrollView addSubview:self.discussTabV];

}
#pragma mark -UIScrollViewDelegate
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    self.clickFlag = YES;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    switch (scrollView.tag) {
        case WNScrollViewTypeBGBottom:
        {
            CGRect rcLineView = self.lineView.frame;
            if (scrollView.contentOffset.x == 0) {
                rcLineView = CGRectMake(37, 40, 50, 6);
                [self.briefBtn setTitleColor:SXRGB16Color(0x4B77F3) forState:UIControlStateNormal];
                self.briefBtn.titleLabel.font = WNFontWithPFMediumForSize(17.0f);
                [self.discussBtn setTitleColor:SXRGB16Color(0xB2B2B2) forState:UIControlStateNormal];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.discussBtn.titleLabel.text];
                UIFont *font1 = WNFontWithPFRegularForSize(17.0f);
                UIFont *font2 = WNFontWithPFRegularForSize(13.0f);
                [attrString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0,2)];
                [attrString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(2,self.discussBtn.titleLabel.text.length-2)];
                self.discussBtn.titleLabel.attributedText = attrString;
            }
            if (scrollView.contentOffset.x == kScreenWidth) {
                rcLineView = CGRectMake(140, 40, 50, 6);
                [self.briefBtn setTitleColor:SXRGB16Color(0xB2B2B2) forState:UIControlStateNormal];
                self.briefBtn.titleLabel.font = WNFontWithPFRegularForSize(17.0f);
                [self.discussBtn setTitleColor:SXRGB16Color(0x4B77F3) forState:UIControlStateNormal];
                NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.discussBtn.titleLabel.text];
                UIFont *font1 = WNFontWithPFMediumForSize(17.0f);
                UIFont *font2 = WNFontWithPFMediumForSize(13.0f);
                [attrString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0,2)];
                [attrString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(2,self.discussBtn.titleLabel.text.length-2)];
                self.discussBtn.titleLabel.attributedText = attrString;
                
            }
            self.lineView.frame = rcLineView;
        }
            break;
            
        default:
            break;
    }
    
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGRect rcHeaderView = self.headerView.frame;
    CGRect rcScrollView = self.scrollView.frame;
    CGRect rcBriefTab = self.briefTabV.frame;
    CGRect rcDiscussTab = self.discussTabV.frame;
    CGRect rcLineView = self.lineView.frame;
    CGFloat float_y = scrollView.contentOffset.y;
    switch (scrollView.tag) {
        case WNScrollViewTypeBG:
        {
            if (headerViewMax_h - float_y > headerViewMin_h) {
                rcHeaderView.size.height = headerViewMax_h -float_y;
                rcHeaderView.origin.y = float_y;
                rcScrollView.origin.y = rcHeaderView.origin.y + rcHeaderView.size.height + 50;
                rcScrollView.size.height = kScreenHeight - headerViewMax_h - 50 + float_y;
                rcBriefTab.size.height = kScreenHeight - headerViewMax_h - 50 + float_y;
                rcDiscussTab.size.height = kScreenHeight - headerViewMax_h - 50 + float_y;
                self.headerView.frame = rcHeaderView;
                self.scrollView.frame = rcScrollView;
                self.briefTabV.frame = rcBriefTab;
                self.discussTabV.frame = rcDiscussTab;
            }else{
                [self.BGScrollView setContentOffset:CGPointMake(0, headerViewMin_h)];
            }
            if (float_y < 0) {
                [self.BGScrollView setContentOffset:CGPointMake(0, 0)];
            }
        }
            break;
            case WNScrollViewTypeBGBottom:
        {
            if (!self.clickFlag) {
                return;
            }
            // 获取真实的滚动的偏移量
            CGFloat index_float = scrollView.contentOffset.x * (103/kScreenWidth);
            
            rcLineView.origin.x = 37 + index_float;
            
            self.lineView.frame = rcLineView;
            
        }
            break;
        case WNScrollViewTypeBrief:
        {
            if (self.BGScrollView.contentOffset.y < headerViewMin_h) {
                [self.BGScrollView setContentOffset:CGPointMake(0, self.BGScrollView.contentOffset.y + float_y)];
                [self.briefTabV setContentOffset:CGPointMake(0, 0)];
            }
            if (self.briefTabV.contentOffset.y <= 0) {
                [self.BGScrollView setContentOffset:CGPointMake(0, self.BGScrollView.contentOffset.y + float_y)];
                [self.briefTabV setContentOffset:CGPointMake(0, 0)];
            }
            
        }
            break;
        case WNScrollViewTypeDiscuss:
        {
            if (self.BGScrollView.contentOffset.y < headerViewMin_h) {
                [self.BGScrollView setContentOffset:CGPointMake(0, self.BGScrollView.contentOffset.y + float_y)];
                [self.discussTabV setContentOffset:CGPointMake(0, 0)];
            }
            if (self.discussTabV.contentOffset.y <= 0) {
                [self.BGScrollView setContentOffset:CGPointMake(0, self.BGScrollView.contentOffset.y + float_y)];
                [self.discussTabV setContentOffset:CGPointMake(0, 0)];
            }
        }
            break;
        default:
            break;
    }
    
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (tableView == self.briefTabV) {
        return 1;
    }else{
        return 30;
    }
    
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    if (tableView == self.briefTabV) {
        WNBriefCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WNBriefCell"];
        if (cell == nil) {
            cell = [[WNBriefCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WNBriefCell"];
        }
        WNUniversityInfoModel *model = self.schoolInfoData[indexPath.row];
        cell.model = model;
        return cell;
    }else{
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WNDiscussCell"];
        if (cell == nil) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WNDiscussCell"];
        }
        cell.textLabel.text = @"讲的非常好～点赞👍";
        return cell;
    }
    
}

#pragma mark -action
- (void)briefBtnAction{
    self.clickFlag = NO;
    [self.briefBtn setTitleColor:SXRGB16Color(0x4B77F3) forState:UIControlStateNormal];
    self.briefBtn.titleLabel.font = WNFontWithPFMediumForSize(17.0f);
    [_discussBtn setTitleColor:SXRGB16Color(0xB2B2B2) forState:UIControlStateNormal];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.discussBtn.titleLabel.text];
    UIFont *font1 = WNFontWithPFRegularForSize(17.0f);
    UIFont *font2 = WNFontWithPFRegularForSize(13.0f);
    [attrString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0,2)];
    [attrString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(2,_discussBtn.titleLabel.text.length-2)];
    _discussBtn.titleLabel.attributedText = attrString;
    //移动动画
    [UIView animateWithDuration:0.2f animations:^{
        CGRect rcLineView = self.lineView.frame;
        rcLineView.origin.x = 37;
        self.lineView.frame = rcLineView;
    }];
    
    CGPoint point = CGPointMake(0, 0);
    // 1.5 设置滚动到居中时需要滚动的距离
    [self.scrollView setContentOffset:point animated:YES];
    
}
- (void)discussBtnAction{
    self.clickFlag = NO;
    [self.briefBtn setTitleColor:SXRGB16Color(0xB2B2B2) forState:UIControlStateNormal];
    self.briefBtn.titleLabel.font = WNFontWithPFRegularForSize(17.0f);
    [_discussBtn setTitleColor:SXRGB16Color(0x4B77F3) forState:UIControlStateNormal];
    NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:self.discussBtn.titleLabel.text];
    UIFont *font1 = WNFontWithPFMediumForSize(17.0f);
    UIFont *font2 = WNFontWithPFMediumForSize(13.0f);
    [attrString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0,2)];
    [attrString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(2,_discussBtn.titleLabel.text.length-2)];
    _discussBtn.titleLabel.attributedText = attrString;
    //移动动画
    [UIView animateWithDuration:0.2f animations:^{
        CGRect rcLineView = self.lineView.frame;
        rcLineView.origin.x = 140;
        self.lineView.frame = rcLineView;
    }];
    
    CGPoint point = CGPointMake(kScreenWidth, 0);
    // 1.5 设置滚动到居中时需要滚动的距离
    [self.scrollView setContentOffset:point animated:YES];

}
- (void)likeBtnAction:(UIButton *)sender{
    sender.selected = !self.likeBtn.selected;
}
#pragma mark -setter
- (void)setUniversityName:(NSString *)universityName{
    _universityName = universityName;
    [self.viewModel loadUniversityInfoDataWithUniversityName:universityName];
    
}
#pragma mark -getter
- (WNUniversityInfoViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNUniversityInfoViewModel alloc] init];
        WeakSelf(self);
        _viewModel.schoolInfoBlock = ^(NSArray * _Nonnull dataArr) {
            weakself.schoolInfoData = dataArr;
            [weakself.briefTabV reloadData];
        };
    }
    return _viewModel;
}
- (UIScrollView *)BGScrollView{
    if (!_BGScrollView) {
        _BGScrollView = [[UIScrollView alloc] init];
        _BGScrollView.bounces = NO;
        _BGScrollView.showsVerticalScrollIndicator = NO;
        _BGScrollView.showsHorizontalScrollIndicator = NO;
        _BGScrollView.scrollEnabled = NO;
        _BGScrollView.tag = WNScrollViewTypeBG;
        _BGScrollView.delegate = self;
        _BGScrollView.contentSize = CGSizeMake(kScreenWidth, kScreenHeight + max_h);;
    }
    return _BGScrollView;
}
- (UIScrollView *)scrollView{
    if (!_scrollView) {
        _scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, headerViewMax_h + sectionView_h, kScreenWidth, kScreenHeight - headerViewMax_h - sectionView_h)];
        _scrollView.showsHorizontalScrollIndicator = NO;
        _scrollView.pagingEnabled = YES;
        _scrollView.tag = WNScrollViewTypeBGBottom;
        _scrollView.bounces = NO;
        _scrollView.backgroundColor = [UIColor redColor];
        _scrollView.delegate = self;
        _scrollView.contentSize = CGSizeMake(kScreenWidth * 2, 0);
    }
    return _scrollView;
}
- (WNInfoHeaderView *)headerView{
    if (!_headerView) {
        _headerView = [[WNInfoHeaderView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, headerViewMax_h)];
        _headerView.backgroundColor = [UIColor whiteColor];
    }
    return _headerView;
}

- (UIView *)sectionView{
    if (!_sectionView) {
        _sectionView = [[UIView alloc] initWithFrame:CGRectMake(0, headerViewMax_h, kScreenWidth, sectionView_h)];
        _sectionView.backgroundColor = [UIColor whiteColor];
        [_sectionView addSubview:self.briefBtn];
        [_sectionView addSubview:self.discussBtn];
        [_sectionView addSubview:self.lineView];
        [_sectionView addSubview:self.likeBtn];
    }
    return _sectionView;
}
- (UITableView *)briefTabV{
    if (!_briefTabV) {
        _briefTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, kScreenHeight - headerViewMax_h - sectionView_h) style:UITableViewStylePlain];
        _briefTabV.delegate = self;
        _briefTabV.dataSource = self;
        _briefTabV.tag = WNScrollViewTypeBrief;
        _briefTabV.showsVerticalScrollIndicator = NO;
        _briefTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _briefTabV.estimatedRowHeight = headerViewMax_h;
        _briefTabV.rowHeight = UITableViewAutomaticDimension;
        _briefTabV.backgroundColor = SXRGB16Color(0xF6F7FA);
    }
    return _briefTabV;
}
- (UITableView *)discussTabV{
    if (!_discussTabV) {
        _discussTabV = [[UITableView alloc] initWithFrame:CGRectMake(kScreenWidth, 0, kScreenWidth, kScreenHeight - headerViewMax_h - sectionView_h) style:UITableViewStylePlain];
        _discussTabV.delegate = self;
        _discussTabV.dataSource = self;
        _discussTabV.tag = WNScrollViewTypeDiscuss;
        _discussTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _discussTabV.estimatedRowHeight = 60;
        _discussTabV.rowHeight = UITableViewAutomaticDimension;
        _discussTabV.backgroundColor = SXRGB16Color(0xF6F7FA);
    }
    return _discussTabV;
}
- (UIButton *)briefBtn{
    if (!_briefBtn) {
        _briefBtn = [[UIButton alloc] initWithFrame:CGRectMake(43, 8, 40, 25)];
        [_briefBtn setTitle:@"简介" forState:UIControlStateNormal];
        [_briefBtn setTitleColor:SXRGB16Color(0x4B77F3) forState:UIControlStateNormal];
        _briefBtn.titleLabel.font = WNFontWithPFMediumForSize(17.0f);
        [_briefBtn addTarget:self action:@selector(briefBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _briefBtn;
}
- (UIButton *)discussBtn{
    if (!_discussBtn) {
        _discussBtn = [[UIButton alloc] initWithFrame:CGRectMake(140, 8, 70, 25)];
        [_discussBtn setTitle:@"评论 666+" forState:UIControlStateNormal];
        [_discussBtn setTitleColor:SXRGB16Color(0xB2B2B2) forState:UIControlStateNormal];
        NSMutableAttributedString *attrString = [[NSMutableAttributedString alloc] initWithString:_discussBtn.titleLabel.text];
        UIFont *font1 = WNFontWithPFRegularForSize(17.0f);
        UIFont *font2 = WNFontWithPFRegularForSize(13.0f);
        [attrString addAttribute:NSFontAttributeName value:font1 range:NSMakeRange(0,2)];
        [attrString addAttribute:NSFontAttributeName value:font2 range:NSMakeRange(2,_discussBtn.titleLabel.text.length-2)];
        _discussBtn.titleLabel.attributedText = attrString;
        [_discussBtn addTarget:self action:@selector(discussBtnAction) forControlEvents:UIControlEventTouchUpInside];
    }
    return _discussBtn;
}
- (UIView *)lineView {
    if (!_lineView) {
        _lineView = [[UIView alloc] initWithFrame:CGRectMake(37, 40, 50, 6)];
        _lineView.backgroundColor = SXRGB16Color(0x4B77F3);
        _lineView.layer.cornerRadius = 3.0f;
    }
    return _lineView;
}
- (UIButton *)likeBtn{
    if (!_likeBtn) {
        _likeBtn = [[UIButton alloc] initWithFrame:CGRectMake(kScreenWidth-56, 9, 38, 34)];
        [_likeBtn setImage:[UIImage imageNamed:@"WNNoLike"] forState:UIControlStateNormal];
        [_likeBtn setImage:[UIImage imageNamed:@"WNLike"] forState:UIControlStateSelected];
        [_likeBtn addTarget:self action:@selector(likeBtnAction:) forControlEvents:UIControlEventTouchUpInside];
    }
    return _likeBtn;
}

@end
