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

#import "DescribeBar.h"
#import "DescribeBarHelper.h"
#import "SoundHelper.h"
static int count = 0;
@interface HomeVC ()<CountDown3ViewDelegate>
{
    NSTimer *_timer;    //time计时器
    
    WaveButton *_timerBtn;
    SoundHelper *_soundTools;
    UILabel *_timeLabel;
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
     _soundTools = [[SoundHelper alloc] initWithSoundPath:[[NSBundle mainBundle] pathForResource:@"Firework.mp3" ofType:nil]];

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
    _timerBtn.delayShowTextTimeInterval = 0;
    
    
    _timeLabel = [[UILabel alloc] init];
    _timeLabel.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_timeLabel];
    NSString *timeString = [@(count) stringValue];
    _timeLabel.text = timeString;
    [_timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        StrongOBJ(strongSelf);
        make.center.equalTo(strongSelf.view);
        make.size.mas_equalTo(CGSizeMake(90, 40));
    }];
    
    
    DescribeBar *descBar = [[DescribeBar alloc] initWithItems:[DescribeBarHelper showModels]];
    descBar.selectIndex = 3;
    [self.view addSubview:descBar];
    [descBar mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.view).offset(10);
        make.right.equalTo(self.view).offset(-10);
        make.height.mas_equalTo(@(40));
        make.top.equalTo(self.view).offset(130);
    }];
    
}

#pragma mark - 倒计时

- (void)countDownPress:(WaveButton *)btn{
    
    btn.selected = !btn.selected;
    
    if ([_timer isValid] ) {
        [self countDownEnd];
        [_soundTools stop];
    }else{
        [self countDownStart];
        [_soundTools play];
    }
}

/**倒计时  */
- (void)countDownStart{
    CountDown3View *countDownView = [[CountDown3View alloc] init];
    countDownView.delegate = self;
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
    _timeLabel.text = [@(++count) stringValue];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

@end
