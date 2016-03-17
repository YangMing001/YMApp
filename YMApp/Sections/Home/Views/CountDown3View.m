//
//  CountDown3View.m
//  YMApp
//
//  Created by YM on 16/3/10.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "CountDown3View.h"

NSInteger const _totalCount = 0;

@interface CountDown3View ()
{
    NSTimer *_timer;
    NSInteger _currentCount;
}
@end

@implementation CountDown3View

- (instancetype)init{
    if (self = [super init]) {
        [self prepareData];
    }
    return self;
}

/**准备数据*/
- (void)prepareData{
    _currentCount = _totalCount;
    _finishText = @"开始";
    _label = [[UILabel alloc] init];
    _label.textAlignment = NSTextAlignmentCenter;
    float fontSize = CGRectGetWidth([UIScreen mainScreen].bounds) * 0.3;
    [_label setFont:[UIFont fontWithName: @"HelveticaNeue-Medium" size:fontSize]];
    [self addSubview:_label];
    _label.alpha = 0;
    WeakOBJ(weakSelf);
    [_label mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf);
    }];
    
    self.opaque = NO;
    self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0];
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    [self mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo([self superview]);
    }];
    
    
}

- (void)setLabel:(UILabel *)label{
    if (_label) {
        [_label removeFromSuperview];
    }
    _label = label;
    [self addSubview:_label];
    _label.center = self.center;
}

- (void)prepareAnimation{
    if (_timer) {
        [_timer invalidate];
    }

    _currentCount = _totalCount;
    
    if (_currentCount == 0) {
        if ([self.delegate respondsToSelector:@selector(countDown3Finished)]) {
            [self.delegate performSelector:@selector(countDown3Finished)];
            [self removeFromSuperview];
            return;
        }
    }
        

    _label.text = [@(_currentCount) stringValue];
    _timer = [NSTimer timerWithTimeInterval:1 target:self selector:@selector(animation) userInfo:nil repeats:YES];
    [[NSRunLoop mainRunLoop] addTimer:_timer forMode:NSRunLoopCommonModes];
}

- (void)animation{
    BLogInfo(@"0000000");
    
    WeakOBJ(weakSelf);
    [UIView animateWithDuration:0.5 animations:^{

        CGAffineTransform transfrom = CGAffineTransformMakeScale(2.5, 2.5);
        StrongOBJ(strongSelf);
        
        self.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
        strongSelf.label.alpha = 1;

        strongSelf.label.transform = transfrom;
        strongSelf.label.alpha = 0;
    } completion:^(BOOL finished) {
        StrongOBJ(strongSelf);

        if (finished) {
            if (_currentCount == 0) {
                if ([self.delegate respondsToSelector:@selector(countDown3Finished)]) {
                    [strongSelf.delegate performSelector:@selector(countDown3Finished)];
                    [_timer invalidate];
                    [strongSelf removeFromSuperview];
                }
            }else{
                strongSelf.label.transform = CGAffineTransformIdentity;
                _currentCount --;
                self.label.text = _currentCount?[@(_currentCount) stringValue]:_finishText;
            }
            
            
        }
    }];
}




- (void)dealloc{
    [_timer invalidate];
    [_label removeFromSuperview];
}


@end
