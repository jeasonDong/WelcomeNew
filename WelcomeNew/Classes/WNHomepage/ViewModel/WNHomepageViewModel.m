//
//  WNHomepageViewModel.m
//  WelcomeNew
//
//  Created by 董翔 on 2019/9/25.
//  Copyright © 2019 dix. All rights reserved.
//

#import "WNHomepageViewModel.h"
#import "WNSearchController.h"
#import "WNLoginViewController.h"
#import "WNRouteController.h"
#import "WNMineView.h"
#import <CoreLocation/CoreLocation.h>
@interface WNHomepageViewModel ()<CLLocationManagerDelegate>
@property (nonatomic, strong) CLLocationManager  *locationManager;
@property (nonatomic, strong) UINavigationController *navigationController;
@property (nonatomic, assign) BOOL bSupportJump;

@end

@implementation WNHomepageViewModel
- (instancetype)init{
    self = [super init];
    if (self) {
        self.bSupportJump = YES;
    }
    return self;
}
-(void)loadHomepageData:(void(^)(NSArray *response))success{
    [WNHomepageModel loadHomepageData:^(NSArray * _Nonnull response) {
        NSArray *dataArr = [NSArray yy_modelArrayWithClass:[WNHomepageModel class] json:response];
        if (success) {
            success(dataArr);
        }
    } failed:^(NSError * _Nonnull error) {
        
    }];
}
-(void)locationBtnActionWithNavigationController:(UINavigationController *)navigationController{
    self.navigationController = navigationController;
    self.bSupportJump = YES;
    self.locationManager.delegate = self;
    [self.locationManager startUpdatingLocation];
}

#pragma mark 获取经纬度delegate
- (void)locationManager:(CLLocationManager*)manager didUpdateLocations:(NSArray*)locations {
    CLLocation*location = [locations lastObject];
    CLLocationDegrees latitude = location.coordinate.latitude;
    CLLocationDegrees longitude = location.coordinate.longitude;
    NSString *lat = [NSString stringWithFormat:@"%f",latitude];
    NSString *lon = [NSString stringWithFormat:@"%f",longitude];
    NSMutableDictionary *dictM = [[NSMutableDictionary alloc] init];
    if (!lat) {
        lat = @"";
    }
    if (!lon) {
        lon = @"";
    }
    [dictM setObject:lat forKey:@"latitude"];
    [dictM setObject:lon forKey:@"longitude"];
    [manager stopUpdatingLocation];
    if (self.bSupportJump) {
        WNRouteController *WNVC = [[WNRouteController alloc] init];
        WNVC.locationDic = dictM.copy;
        [self.navigationController pushViewController:WNVC animated:YES];
        self.bSupportJump = NO;
    }
}
- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error{
    
}
#pragma mark -getter
- (CLLocationManager *)locationManager{
    if (!_locationManager) {
        _locationManager = [[CLLocationManager alloc] init];
        _locationManager.distanceFilter = 100;
        _locationManager.desiredAccuracy = kCLLocationAccuracyBest;
        if (IS_IOS(8)) {
            //提示用户开启定位
            [_locationManager requestAlwaysAuthorization]; // 永久授权
            [_locationManager requestWhenInUseAuthorization]; //使用中授权
        }
    }
    return _locationManager;
}
@end
