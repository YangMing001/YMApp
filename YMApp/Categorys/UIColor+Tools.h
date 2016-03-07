//
//  UIColor+Tools.h
//  YMApp
//
//  Created by YM on 16/3/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIColor (Tools)

/**
 *  转换颜色值，如0xffffff
 */
+ (UIColor *)colorWithRGBHex:(UInt32)hex;

/**
 *  通过正常的整数转化颜色 234 255 1
 */
+ (UIColor *)colorNumericalWithRed:(CGFloat)red green:(CGFloat)green blue:(CGFloat)blue;

@end
