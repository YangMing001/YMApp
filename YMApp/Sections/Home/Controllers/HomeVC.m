//
//  HomeVC.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "HomeVC.h"
#import "SecondVC.h"
#import "CountDown3View.h"
#import "WaveButton.h"

static int count = 0;
@interface HomeVC ()<CountDown3ViewDelegate>
{
    NSTimer *_timer;    //time计时器
    
    WaveButton *_timerBtn;
}
@end

@implementation HomeVC

- (void)viewDidLoad {
    [super viewDidLoad];
   
    [self configData];
    [self configUI];
}

/**配置数据*/
- (void)configData{
    [[CrashReporter sharedInstance] setSceneTag:11420];
    

}

/**配置UI*/
- (void)configUI{
    self.navBar.leftType = NavBarLeftTypeDefault;
    
    _timerBtn = [[WaveButton alloc] init];

    [_timerBtn addTarget:self action:@selector(countDownPress:) forControlEvents:(UIControlEventTouchUpInside)];
    [self.view addSubview:_timerBtn];

    WeakOBJ(weakSelf);
    [_timerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongOBJ(strongSelf);
        make.centerX.equalTo(strongSelf.view);
        make.centerY.equalTo(strongSelf.view).offset(30);
        make.size.mas_equalTo(CGSizeMake(40, 40));
    }];
    _timerBtn.selected = NO;
}

#pragma mark - 倒计时

- (void)countDownPress:(WaveButton *)btn{
    
    btn.selected = !btn.selected;
    
    if ([_timer isValid] ) {
        [self countDownEnd];
    }else{
        [self countDownStart];
    }
}

/**倒计时  */
- (void)countDownStart{
    CountDown3View *countDownView = [[CountDown3View alloc] init];
    [self.view addSubview:countDownView];
    countDownView.delegate = self;
    WeakOBJ(weakSelf);
    [countDownView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.view);
    }];
    [countDownView prepareAnimation];
}

- (void)countDown3Finished{
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(countDown) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)countDownEnd{
    [_timer invalidate];
    count = 0;
}

- (void)countDown{
    BLogInfo(@"%@",@(count++));
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
