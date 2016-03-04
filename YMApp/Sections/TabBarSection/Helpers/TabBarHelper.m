//
//  TabBarHelper.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "TabBarHelper.h"

#import "HomeVC.h"
#import "MineVC.h"
#import "OrderVC.h"
#import "ShopVC.h"

#import "NavigationController.h"

#import <FontAwesomeTools/FontAwesome.h>
@implementation TabBarHelper

+ (NSArray<ControllerModel *> *)tabBarControllerModels{
   
    HomeVC *homeVc = [HomeVC new];
    homeVc.title = @"首页";
    ControllerModel *homeModel = [TabBarHelper ctrlModelWithVC:homeVc iconName:fa_star];
    
    
    MineVC *mineVC = [MineVC new];
    mineVC.title = @"我的";
    ControllerModel *MineModel = [TabBarHelper ctrlModelWithVC:mineVC iconName:fa_search];
    
    OrderVC *orderVC = [OrderVC new];
    orderVC.title = @"订单";
    ControllerModel *OrderModel = [TabBarHelper ctrlModelWithVC:orderVC iconName:fa_outdent];
    
    ShopVC *shopVC = [ShopVC new];
    shopVC.title = @"商城";
    ControllerModel *ShopModel = [TabBarHelper ctrlModelWithVC:shopVC iconName:fa_envelope];

    return @[homeModel,OrderModel,ShopModel,MineModel];
}

+ (NSArray<UIViewController *> *)tabBarControllers{
    NSArray *controllerModels = [TabBarHelper tabBarControllerModels];
    
    NSMutableArray *ctrls = [NSMutableArray array];
    for (NSInteger i = 0; i < controllerModels.count ; i++) {
        [ctrls addObject:[controllerModels[i] controller]];
    }
    return [ctrls copy];
}

+ (ControllerModel *)ctrlModelWithVC:(UIViewController *)vc iconName:(NSString *)iconName{
    ControllerModel *vcModel = [ControllerModel new];
    
    NavigationController *nav = [[NavigationController alloc] initWithRootViewController:vc];
    
    vcModel.controller = nav;
    vcModel.normalImage = [FontAwesome imageWithIcon:iconName iconColor:nil iconSize:iconSize_Tabbar];
    vcModel.selectImage = [FontAwesome imageWithIcon:iconName iconColor:[UIColor redColor] iconSize:iconSize_Tabbar];
    
    UITabBarItem *item = [[UITabBarItem alloc] initWithTitle:@"" image:vcModel.normalImage selectedImage:vcModel.selectImage];
    item.badgeValue = @"13";
    nav.tabBarItem = item;
    return vcModel;
}

@end
