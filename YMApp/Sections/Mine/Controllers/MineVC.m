//
//  MineVC.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "MineVC.h"

#import "InvocationOperation.h"
#import "BlockOperation.h"

#import "NonConcurrentOperation.h"
#import "ConCurrentOperation.h"

#import "DBManager.h"
#import <CoreLocation/CLLocationManager.h>

@interface MineVC ()<CLLocationManagerDelegate>
{
    CLLocationCoordinate2D l2;
}
@end

@implementation MineVC

- (void)viewDidLoad {
    [super viewDidLoad];

    [self configData];
    [self configUI];
}

/**配置数据*/
- (void)configData{
    /**简单 InvocationOperation 封装*/
//    NSInvocationOperation *op = [[InvocationOperation alloc] invocationOperationWithData:@"zz"];
//    [op start];
//    NSInvocationOperation *op1 = [[InvocationOperation alloc] invocationOperationWithData:@"zz" userInfo:@""];
//    [op1 start];

//    NSBlockOperation *blockOp = [[BlockOperation alloc] blockOperation];
//    [blockOp  start];
    
    
//    NonConcurrentOperation *nonConOp = [[NonConcurrentOperation alloc] initWithData:@"cc"];
//    [nonConOp start];
    
//    ConCurrentOperation *conOp = [[ConCurrentOperation alloc] init];
//    [conOp start];
    
    CLLocationManager *locMan = [[CLLocationManager alloc] init];
    locMan.delegate = self;
    [locMan requestAlwaysAuthorization];
}

/**配置UI*/
- (void)configUI{
    self.navBar.leftType = NavBarLeftTypeDefault;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    DBManager *manager = [DBManager manager];
//    [manager newDBVersionInit];
//    UILocalNotification *locNotfication = [[UILocalNotification alloc] init];
//    locNotfication.alertTitle = @"title";
//    locNotfication.alertBody = @"body";
//    locNotfication.alertAction = @"action";
//    locNotfication.alertLaunchImage = @"ym1.jpg";
    
    [self notificationClicked];
}


- (void)notificationClicked{
    UILocalNotification *locNotfication = [[UILocalNotification alloc] init];
    locNotfication.fireDate = [NSDate dateWithTimeIntervalSinceNow:5];
    //    notification.category = @"INVITE_CATEGORY";
    locNotfication.timeZone = [NSTimeZone defaultTimeZone];
    locNotfication.alertTitle = @"title";
    locNotfication.alertBody = @"body";
    locNotfication.alertAction = @"action";

    locNotfication.regionTriggersOnce = YES;
//
//    locNotfication.region = [[CLCircularRegion alloc]
//                              initWithCenter:l2
//                              radius:100
//                              identifier:@"casda"];
//    locNotfication.soundName = UILocalNotificationDefaultSoundName;
    
    
    locNotfication.applicationIconBadgeNumber = 1;
    [[UIApplication sharedApplication] scheduleLocalNotification:locNotfication];
}

- (void)locationManager:(CLLocationManager *)manager didChangeAuthorizationStatus:(CLAuthorizationStatus)status{
    BOOL canUseLocationNotifications = (status == kCLAuthorizationStatusAuthorizedAlways);
}

- (void)locationManagerDidPauseLocationUpdates:(CLLocationManager *)manager{
    
}

- (void)locationManagerDidResumeLocationUpdates:(CLLocationManager *)manager{
    
}

- (void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray<CLLocation *> *)locations{
    CLLocation *l = [locations firstObject];
    l2 = l.coordinate;
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
