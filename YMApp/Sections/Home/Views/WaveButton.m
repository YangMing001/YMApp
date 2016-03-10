//
//  WaveButton.m
//  YMApp
//
//  Created by YM on 16/3/10.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "WaveButton.h"
#import "UIColor+Tools.h"
#import "ColorConfiger.h"
@interface WaveButton ()
{

    CADisplayLink *_timer;
    UILabel *_label;

}
@end

@implementation WaveButton

- (instancetype)init{
    if (self = [super init]) {
        _delayShowTextTimeInterval = 4;
    }
    return self;
}



- (void)setSelected:(BOOL)selected{
    [super setSelected:selected];
    if (!selected) {
        [self waveAnimationStart];
    }else{
        [self waveAnimationEnd];
    }
}

/**
 *  水波纹动画开始
 */
- (void)waveAnimationStart{
    [_timer invalidate];
    _label.hidden = YES;
    _timer = [CADisplayLink displayLinkWithTarget:self selector:@selector(waveStar)];
    _timer.frameInterval = 40;
    [_timer addToRunLoop:[NSRunLoop mainRunLoop] forMode:NSDefaultRunLoopMode];
}

/**
 *  动画
 */
- (void)waveStar{
    CALayer *layer = [[CALayer alloc] init];
    layer.cornerRadius = self.bounds.size.width/2;
    layer.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
    UIColor *color = [UIColor colorNumericalWithRed:arc4random()%255 green:1 blue:arc4random()%255];
    layer.backgroundColor = color.CGColor;
    [self.layer addSublayer:layer];
    
    CAMediaTimingFunction *defaultCurve = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    
    CAAnimationGroup *_group = [CAAnimationGroup animation];
    _group.delegate = self;
    _group.duration = 2;
    _group.removedOnCompletion = YES;
    _group.timingFunction = defaultCurve;
    
    CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale.xy"];
    scaleAnimation.fromValue = @0.0;
    scaleAnimation.toValue = @1.0;
    scaleAnimation.duration = 2;
    
    CAKeyframeAnimation *opencityAnimation = [CAKeyframeAnimation animationWithKeyPath:@"opacity"];
    opencityAnimation.duration = 2;
    opencityAnimation.values = @[@0.8,@0.4,@0];
    opencityAnimation.keyTimes = @[@0,@0.5,@1];
    opencityAnimation.removedOnCompletion = YES;
    
    NSArray *animations = @[scaleAnimation,opencityAnimation];
    _group.animations = animations;
    [layer addAnimation:_group forKey:nil];
    
    [self performSelector:@selector(removeLayer:) withObject:layer afterDelay:1.5];
}

- (void)removeLayer:(CALayer *)layer{
    [layer removeFromSuperlayer];
}


/*
 *  水波纹动画结束
 */
- (void)waveAnimationEnd{
    [_timer invalidate];

    if (!_label) {
        _label = [[UILabel alloc] init];
        
        _label.frame = CGRectMake(0, 0, self.bounds.size.width, self.bounds.size.width);
        [_label setText:@"停止"];
        [_label setFont:[UIFont systemFontOfSize:self.bounds.size.width/3]];
        //字体的名字 不是 UIFont
        [_label setTextColor:[UIColor colorMain]];
        [_label setBackgroundColor:[UIColor colorViewBG]];
        [_label setTextAlignment:NSTextAlignmentCenter];
        
        _label.layer.borderColor = [UIColor colorMain].CGColor;
        _label.layer.borderWidth = 2;
        
        [self addSubview:_label];
        _label.hidden = YES;
    }
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_delayShowTextTimeInterval * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [_label setHidden:NO];
    });

}

@end
