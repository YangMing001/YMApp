//
//  TabBarHelper.h
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseHelper.h"
#import "ControllerModel.h"

@interface TabBarHelper : BaseHelper

+ (NSArray<UIViewController *> *)tabBarControllers;

+ (NSArray<ControllerModel *> *)tabBarControllerModels;

@end
