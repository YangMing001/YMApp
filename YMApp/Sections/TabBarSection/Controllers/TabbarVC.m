//
//  TabbarVC.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "TabbarVC.h"
#import "TabBarHelper.h"
@interface TabbarVC ()<UITabBarControllerDelegate>

@end

@implementation TabbarVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
}

/**配置UI*/
- (void)configUI{
    self.tabBar.hidden = YES;
    NSArray *controllerModels = [TabBarHelper tabBarControllers];
    
    NSMutableArray *ctrls = [NSMutableArray array];
    for (NSInteger i = 0; i < controllerModels.count ; i++) {
        [ctrls addObject:[controllerModels[i] controller]];
    }
    self.viewControllers = [ctrls copy];
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
