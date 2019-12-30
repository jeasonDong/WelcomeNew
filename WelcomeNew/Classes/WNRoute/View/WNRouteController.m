//
//  WNRouteVC.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/4.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNRouteController.h"
#import "WNRouteCell.h"
#import "WNRouteViewModel.h"
@interface WNRouteController ()<UITableViewDelegate,UITableViewDataSource>
//顶部视图
@property (nonatomic, strong) UIView *headerView;
@property (nonatomic, strong) UIImageView *headerIMGV;
//出发地
@property (nonatomic, strong) UITextField *departureTF;
//目的地
@property (nonatomic, strong) UITextField *destinationTF;
//切换按钮
@property (nonatomic, strong) UIButton *changeBtn;
//顶部线
@property (nonatomic, strong) UIView *lineView;
//推荐路线
@property (nonatomic, strong) UILabel *routeLab;
//显示路线
@property (nonatomic, strong) UITableView *routeTabV;
//底部视图
@property (nonatomic, strong) UIView *bottomView;
//导航按钮
@property (nonatomic, strong) UIButton *routeBtn;
//viewModel
@property (nonatomic, strong) WNRouteViewModel *viewModel;
//路线数据
@property (nonatomic, strong) NSArray *routeData;

@end

@implementation WNRouteController

- (void)setUpUI{
    [super setUpUI];
    self.titleView.hidden = YES;
    //创建界面
    [self setUpUIs];
    
}
- (void)setUpUIs{
    self.view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:self.headerView];
    [self.headerView addSubview:self.headerIMGV];
    [self.headerView addSubview:self.departureTF];
    [self.headerView addSubview:self.lineView];
    [self.headerView addSubview:self.destinationTF];
    [self.headerView addSubview:self.changeBtn];
    [self.view addSubview:self.routeLab];
    [self.view addSubview:self.routeTabV];
    [self.view addSubview:self.bottomView];
    [self.bottomView addSubview:self.routeBtn];
    [self.headerView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left).offset(18);
        make.right.equalTo(self.view.mas_right).offset(-18);
        make.top.equalTo(self.view.mas_top).offset(TABBAR_HEIGHT + 10);
        make.height.offset(75);
    }];
    [self.headerIMGV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top);
        make.bottom.equalTo(self.headerView.mas_bottom);
        make.left.equalTo(self.headerView.mas_left).offset(8);
        make.width.offset(30);
        
    }];
    [self.departureTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.headerView.mas_top).offset(2);
        make.left.equalTo(self.headerIMGV.mas_right).offset(16);
        make.right.equalTo(self.headerView.mas_right).offset(-35);
        make.height.offset(35);
    }];
    [self.lineView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.departureTF.mas_left);
        make.right.equalTo(self.departureTF.mas_right);
        make.top.equalTo(self.departureTF.mas_bottom);
        make.height.offset(1);
    }];
    [self.destinationTF mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.lineView.mas_bottom);
        make.left.equalTo(self.lineView.mas_left);
        make.right.equalTo(self.lineView.mas_right);
        make.bottom.equalTo(self.headerView.mas_bottom).offset(-2);
    }];
    [self.changeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.equalTo(self.headerView.mas_centerY).offset(0);
        make.right.equalTo(self.headerView.mas_right);
    }];
    [self.routeLab mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.headerView.mas_left);
        make.top.equalTo(self.headerView.mas_bottom).offset(22);
    }];
    [self.bottomView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view.mas_left);
        make.bottom.equalTo(self.view.mas_bottom);
        make.right.equalTo(self.view.mas_right);
        make.height.offset(80);
    }];
    [self.routeTabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.routeLab.mas_bottom).offset(22);
        make.left.equalTo(self.view.mas_left);
        make.right.equalTo(self.view.mas_right);
        make.bottom.equalTo(self.bottomView.mas_top);
    }];
    [self.routeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.bottomView.mas_top).offset(15);
        make.left.equalTo(self.bottomView.mas_left).offset(37);
        make.right.equalTo(self.bottomView.mas_right).offset(-37);
        make.bottom.equalTo(self.bottomView.mas_bottom).offset(-15);
    }];
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.routeData.count;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WNRouteCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WNRouteCell"];
    if (cell == nil) {
        cell = [[WNRouteCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WNRouteCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    cell.model = self.routeData[indexPath.row];
    return cell;
}
#pragma mark -action
- (void)routeButonAction{
    WeakSelf(self)
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:nil message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"去高德地图导航" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        NSString *urlString = [NSString stringWithFormat:@"iosamap://path?sourceApplication=%@&sname=%@&dname=%@&dev=0&t=0&sid=BGVIS1&did=BGVIS2",source_appLication,@"我的位置",@"西南大学"];
        // 打开地图APP
        if (urlString){
            NSURL *targetURL = [NSURL URLWithString:[urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]]];
            if (@available(iOS 10.0, *)){
                [[UIApplication sharedApplication] openURL:targetURL options:@{} completionHandler:^(BOOL success) {
                    
                }];
            }else{
                // Fallback on earlier versions
                [[UIApplication sharedApplication] openURL:targetURL];
            }
        }
    }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
        //响应事件
        [weakself.navigationController popViewControllerAnimated:YES];
    }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    [self presentViewController:alert animated:YES completion:nil];
    
}
#pragma mark -setter
- (void)setLocationDic:(NSDictionary *)locationDic{
    _locationDic = locationDic;
    [self.viewModel loadRouteDataWithLatitude:[locationDic objectForKey:@"latitude"] withLongitude:[locationDic objectForKey:@"longitude"]];
}
#pragma mark -getter
- (UIView *)headerView{
    if (!_headerView) {
        _headerView = [[UIView alloc] init];
        _headerView.backgroundColor = SXRGB16Color(0xF9F9F9);
        _headerView.layer.cornerRadius = 5.0f;
    }
    return _headerView;
}
- (UIImageView *)headerIMGV{
    if (!_headerIMGV) {
        _headerIMGV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"WNLeftHeaderTitle"]];
    }
    return _headerIMGV;
}
- (UITextField *)departureTF{
    if (!_departureTF) {
        _departureTF = [[UITextField alloc] init];
        _departureTF.font = WNFontWithPFRegularForSize(14.0f);
        _departureTF.text = @"天堂软件园";
        _departureTF.placeholder = @"输入起点";
        _departureTF.textColor = SXRGB16Color(0x222222);
    }
    return _departureTF;
}
- (UITextField *)destinationTF{
    if (!_destinationTF) {
        _destinationTF = [[UITextField alloc] init];
        _destinationTF.font = WNFontWithPFRegularForSize(14.0f);
        _destinationTF.text = @"西南大学";
        _destinationTF.placeholder = @"输入终点";
        _destinationTF.textColor = SXRGB16Color(0x222222);
    }
    return _destinationTF;
}
- (UIButton *)changeBtn{
    if (!_changeBtn) {
        _changeBtn = [[UIButton alloc] init];
        [_changeBtn setImage:[UIImage imageNamed:@"WNChangeBotton"] forState:UIControlStateNormal];
        [_changeBtn setImage:[UIImage imageNamed:@"WNChangeBotton"] forState:UIControlStateHighlighted];
    }
    return _changeBtn;
}
- (UIView *)lineView{
    if (!_lineView) {
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = SXRGB16Color(0xE6E6E6);
    }
    return _lineView;
}
- (UILabel *)routeLab{
    if (!_routeLab) {
        _routeLab = [[UILabel alloc] init];
        _routeLab.text = @"推荐路线";
        _routeLab.font = WNFontWithPFSemiboldForSize(18.0f);
        _routeLab.textColor = SXRGB16Color(0x222222);
    }
    return _routeLab;
}
- (UITableView *)routeTabV{
    if (!_routeTabV) {
        _routeTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _routeTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _routeTabV.estimatedRowHeight = 120;
        _routeTabV.rowHeight = UITableViewAutomaticDimension;
        _routeTabV.bounces = NO;
        _routeTabV.delegate = self;
        _routeTabV.dataSource = self;
    }
    return _routeTabV;
}
- (UIView *)bottomView{
    if (!_bottomView) {
        _bottomView = [[UIView alloc] init];
        _bottomView.backgroundColor = [UIColor whiteColor];
        _bottomView.layer.shadowColor = SXRGB16Color(0x8A8A8A).CGColor;
        _bottomView.layer.shadowOffset = CGSizeMake(0,4);
        _bottomView.layer.shadowOpacity = 0.6;
        _bottomView.layer.shadowRadius = 4;
    }
    return _bottomView;
}
- (UIButton *)routeBtn{
    if (!_routeBtn) {
        _routeBtn = [[UIButton alloc] init];
        [_routeBtn setTitle:@"去导航" forState:UIControlStateNormal];
        [_routeBtn setTitleColor:SXRGB16Color(0xFFFFFF) forState:UIControlStateNormal];
        [_routeBtn setBackgroundColor:SXRGB16Color(0x4B77F3)];
        [_routeBtn setImage:[UIImage imageNamed:@"WNRouteButton"] forState:UIControlStateNormal];
        [_routeBtn addTarget:self action:@selector(routeButonAction) forControlEvents:UIControlEventTouchUpInside];
        _routeBtn.titleLabel.font = WNFontWithPFMediumForSize(16.0f);
        _routeBtn.layer.cornerRadius = 4.0f;
    }
    return _routeBtn;
}
- (WNRouteViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNRouteViewModel alloc] init];
        WeakSelf(self);
        _viewModel.routeDataBlock = ^(NSArray * _Nonnull dataArr) {
            weakself.routeData = dataArr;
            [weakself.routeTabV reloadData];
        };
    }
    return _viewModel;
}
@end
