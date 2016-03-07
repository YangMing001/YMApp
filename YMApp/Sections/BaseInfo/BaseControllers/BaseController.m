//
//  BaseController.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseController.h"

@interface BaseController ()<NavigationBarDelegate>

@end

@implementation BaseController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self configUI];
    [self configData];
}

/**配置数据*/
- (void)configData{
    _navBar.leftType = NavBarLeftTypeBack;
}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [TalkingData trackPageBegin:self.title];
}

- (void)viewDidDisappear:(BOOL)animated{
    [TalkingData trackPageEnd:self.title];
    [super viewDidDisappear:animated];
}

/**配置UI*/
- (void)configUI{
    self.view.backgroundColor = [ColorConfiger colorViewBG];
    _navBar = [NavigationBar new];
    _navBar.delegate = self;
    [self.view addSubview:_navBar];
    WeakOBJ(weakSelf);
    [_navBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.top.with.trailing.equalTo(weakSelf.view);
        make.height.mas_equalTo(@64);
    }];
    
    if (self.title) {
        self.navBar.title = self.title;
    }
}

- (void)setNavBarHide:(BOOL)navBarHide{
    _navBarHide = navBarHide;
    _navBar.hidden = _navBarHide;
}

#pragma mark -NavBarDelegate
- (void)navBarView:(NavigationBar *)navBarView leftClicked:(id)sender{
    [self leftClick];
}

- (void)navBarView:(NavigationBar *)navBarView rightClicked:(id)sender{
    [self rightClick];
}

- (void)leftClick{
    if (self.navigationController.topViewController == self.navigationController.visibleViewController) {
        [self.navigationController popViewControllerAnimated:YES];
    }else{
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}

- (void)rightClick{
    //to do something
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
