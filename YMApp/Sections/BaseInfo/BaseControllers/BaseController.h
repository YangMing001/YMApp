//
//  BaseController.h
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "NavigationBar.h"

@interface BaseController : UIViewController

@property (nonatomic,strong) NavigationBar *navBar;
@property (nonatomic,getter=isNavBarHide) BOOL navBarHide;
- (void)leftClick;
- (void)rightClick;


@end
