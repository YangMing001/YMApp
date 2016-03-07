//
//  Gauge.h
//  YMApp
//
//  Created by YM on 16/3/5.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseView.h"
#import <QuartzCore/QuartzCore.h>
@interface Gauge : BaseView
{
    UIImage *gaugeView;
    UIImageView *pointer;
    
    CGFloat maxNum;
    CGFloat minNum;
    
    CGFloat maxAngle;
    CGFloat minAngle;
    
    CGFloat gaugeValue;
    CGFloat gaugeAngle;
    
    CGFloat angleperValue;
    CGFloat scoleNum;
    
    NSMutableArray *labelArray;
    CGContextRef context;
}

@property (nonatomic,strong) UIImage *gaugeView;
@property (nonatomic,strong) UIImageView *pointer;
@property (nonatomic,strong) NSMutableArray *labelArray;
@property (nonatomic) CGContextRef context;
-(void)setGaugeValue:(CGFloat)value animation:(BOOL)isAnim;
@end
