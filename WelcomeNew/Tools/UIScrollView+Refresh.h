//
//  UIScrollView+Refresh.h
//  黄岩项目
//
//  Created by 周冰烽 on 2016/11/8.
//  Copyright © 2016年 周冰烽. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MJRefresh.h>
@interface UIScrollView (Refresh)

/** 添加头部刷新 */
-(void)addHeaderRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 开始头部刷新 */
-(void)beginHeaderRefresh;
/** 结束头部刷新 */
-(void)endHeaderRefresh;

/** 添加底部自动刷新 */
-(void)addAutoFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 添加底部返回刷新 */
-(void)addBackFooterRefresh:(MJRefreshComponentRefreshingBlock)block;
/** 开始底部刷新 */
-(void)beginFooterRefresh;
/** 结束底部刷新 */
-(void)endFooterRefresh;

@end
