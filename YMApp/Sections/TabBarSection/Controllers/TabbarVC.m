//
//  TabbarVC.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "TabbarVC.h"
#import "TabBarHelper.h"
#import "TabBar.h"

#import "Define.h"

@interface TabbarVC ()<UITabBarControllerDelegate>
{
    TabBar *_bar;
}
@end

@implementation TabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    
   
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(showTabbar) name:Notification_ShowTabBar object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(hideTabbar) name:Notification_HideTabBar object:nil];
}

/**配置UI*/
- (void)configUI{
    self.tabBar.hidden = YES;
    self.viewControllers = [TabBarHelper tabBarControllers];
    
    _bar = [[TabBar alloc] initWithImages:[TabBarHelper tabBarControllerModels]];
    _bar.delegate = self;
    [self.view addSubview:_bar];
    
    __weak typeof(self) weakSelf = self;
    [_bar mas_makeConstraints:^(MASConstraintMaker *make) {
        __strong typeof(weakSelf) strongSelf = weakSelf;
        make.leading.and.trailing.equalTo(strongSelf.view);
        make.bottom.equalTo(strongSelf.view);
        make.height.mas_equalTo([NSNumber numberWithInteger:high_Tabbar]);
    }];
}

- (void)hideTabbar{
    [_bar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([NSNumber numberWithInteger:0]);

    }];
}

- (void)showTabbar{
    [_bar mas_updateConstraints:^(MASConstraintMaker *make) {
        make.height.mas_equalTo([NSNumber numberWithInteger:high_Tabbar]);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

////设置状态栏的（亮色）白色
//-(UIStatusBarStyle)preferredStatusBarStyle
//{
//    return UIStatusBarStyleLightContent;
//}
@end
