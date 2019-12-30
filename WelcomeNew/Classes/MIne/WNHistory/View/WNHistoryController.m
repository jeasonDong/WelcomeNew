//
//  WNHistoryController.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/11/19.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNHistoryController.h"
#import "WNHistoryCell.h"
#import "WNHistoryViewModel.h"
#import "WNHistoryModel.h"
#import "WNUniversityInfoController.h"
#import "WNHomepageViewModel.h"
@interface WNHistoryController ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) UITableView *universityTabV;
@property (nonatomic, strong) WNHistoryViewModel  *viewModel;
@property (nonatomic, strong) WNHomepageViewModel  *homeViewModel;
@property (nonatomic, strong) NSArray <WNHistoryModel *> *historyArr;
@end

@implementation WNHistoryController
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
    NSArray *data = getHistoryInfo();
    [self.viewModel loadHistoryDataWithData:data];
}
- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [[UIApplication sharedApplication] setStatusBarHidden:YES withAnimation:UIStatusBarAnimationSlide];
}
- (void)setUpUI{
    [super setUpUI];
    [self setUpUIs];
    self.historyArr = nil;
    self.titleText = @"历史记录";
    self.titleColor = [UIColor blackColor];
}
- (void)setUpUIs{
    [self.view addSubview:self.universityTabV];
    [self.universityTabV mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.mas_equalTo(self.view);
        make.top.equalTo(self.titleView.mas_bottom);
    }];
}
#pragma mark UITableViewDataSource
- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.historyArr.count;
}
- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    WNHistoryCell *cell = [tableView dequeueReusableCellWithIdentifier:@"WNHistoryCell"];
    if (cell == nil) {
        cell = [[WNHistoryCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"WNHistoryCell"];
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    WNHistoryModel *model = self.historyArr[indexPath.row];
    cell.model = model;
    WeakSelf(self);
    cell.locatinButtonblock = ^(WNHistoryModel * _Nonnull model) {
        [weakself.homeViewModel locationBtnActionWithNavigationController:weakself.navigationController];
    };
    return cell;
}
#pragma mark UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 100;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    WNUniversityInfoController *WNVC = [[WNUniversityInfoController alloc] init];
    WNVC.universityName = self.historyArr[indexPath.row].universityName;
    [self.navigationController pushViewController:WNVC animated:YES];
}

- (UISwipeActionsConfiguration *)tableView:(UITableView *)tableView trailingSwipeActionsConfigurationForRowAtIndexPath:(NSIndexPath *)indexPath  API_AVAILABLE(ios(11.0)){
    //删除
    NSMutableArray *arr = self.historyArr.mutableCopy;
    UIContextualAction *deleteRowAction = [UIContextualAction contextualActionWithStyle:UIContextualActionStyleDestructive title:@"删除" handler:^(UIContextualAction * _Nonnull action, __kindof UIView * _Nonnull sourceView, void (^ _Nonnull completionHandler)(BOOL)) {
        [arr removeObjectAtIndex:indexPath.row];
        completionHandler (YES);
        deleteHistoryInfo(indexPath.row);
        self.historyArr = arr.copy;
        [self.universityTabV reloadData];
    }];
    deleteRowAction.image = [UIImage imageNamed:@"删除"];
    deleteRowAction.backgroundColor = [UIColor redColor];
    
    UISwipeActionsConfiguration *config = [UISwipeActionsConfiguration configurationWithActions:@[deleteRowAction]];
    return config;
}

#pragma mark -getter
- (UITableView *)universityTabV{
    if (!_universityTabV) {
        _universityTabV = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 0, 0) style:UITableViewStylePlain];
        _universityTabV.separatorStyle = UITableViewCellSeparatorStyleNone;
        _universityTabV.bounces = NO;
        _universityTabV.delegate = self;
        _universityTabV.dataSource = self;
    }
    return _universityTabV;
}
- (WNHistoryViewModel *)viewModel{
    if (!_viewModel) {
        _viewModel = [[WNHistoryViewModel alloc] init];
        WeakSelf(self);
        _viewModel.historyDataBlock = ^(NSArray * _Nonnull dataArr) {
            dispatch_async(dispatch_get_main_queue(), ^{
                weakself.historyArr = dataArr;
                [weakself.universityTabV reloadData];
            });

        };
    }
    return _viewModel;
}
- (WNHomepageViewModel *)homeViewModel{
    if (!_homeViewModel) {
        _homeViewModel = [[WNHomepageViewModel alloc] init];
    }
    return _homeViewModel;
}
@end
