//
//  NavigationController.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "NavigationController.h"
#import "Define.h"
@interface NavigationController ()<UINavigationControllerDelegate>

@end

@implementation NavigationController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)navigationController:(UINavigationController *)navigationController didShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    if (viewController == [self.viewControllers firstObject]) {
        //rootViewController
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [[NSNotificationCenter defaultCenter] postNotificationName:Notification_ShowTabBar object:nil];
        });
    }
}

- (void)navigationController:(UINavigationController *)navigationController willShowViewController:(UIViewController *)viewController animated:(BOOL)animated{
    NSInteger index = [navigationController.viewControllers indexOfObject:viewController];
    if (index ==1) {
        //上级页面为Root
        [[NSNotificationCenter defaultCenter] postNotificationName:Notification_HideTabBar object:nil];
    }
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
