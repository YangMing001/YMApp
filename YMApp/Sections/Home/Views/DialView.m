//
//  DialView.m
//  YMApp
//
//  Created by YM on 16/3/5.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "DialView.h"

#define kBigMilestoneCount 10       //里程碑数
#define kSmallPerMilestoneCount 5   //大的里程碑包含多少小的


@interface DialView ()
{
    CGContextRef _context;
    
    CGFloat _radius;    //圆的半径
    CGPoint _centerPoint;   //中心点
    
}

@end

@implementation DialView

- (void)drawRect:(CGRect)rect
{
    _context = UIGraphicsGetCurrentContext();
    CGFloat x = CGRectGetMinX(rect);
    CGFloat y = CGRectGetMinY(rect);
    CGFloat width   = CGRectGetWidth(rect);
    CGFloat height  = CGRectGetHeight(rect);
    _radius =  (width > height?width/2:height/2) - 5;
    _centerPoint = CGPointMake((width - x)/2, (height - y)/2);
    [self drawLine];
    
    
    
    
    
    
    free(_context);
}

//画刻度
- (void)drawLine{
    int count = kBigMilestoneCount * kSmallPerMilestoneCount + 1;
}


@end
