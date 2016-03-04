//
//  TabBar.h
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ControllerModel.h"
#import "BaseView.h"

@interface TabBar :BaseView

@property (nonatomic,weak) UITabBarController *delegate;

- (instancetype)initWithImages:(NSArray<ControllerModel *> *)images;

@end
