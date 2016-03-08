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

@interface MineVC ()

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
}

/**配置UI*/
- (void)configUI{
    self.navBar.leftType = NavBarLeftTypeDefault;
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    DBManager *manager = [DBManager manager];
    [manager newDBVersionInit];
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
