//
//  UIColor+Configer.m
//  YMApp
//
//  Created by YM on 16/3/10.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "UIColor+Configer.h"
#import "UIColor+Tools.h"
@implementation UIColor (Configer)

/**主色调*/
+ (UIColor *)colorMain{
    //    return [UIColor colorWithRGBHex:0xf44336];
    return [UIColor colorNumericalWithRed:78 green:184 blue:108];
}

/**view 的背景色*/
+ (UIColor *)colorViewBG{
    return [UIColor colorWithRGBHex:0xd9d9d9];
}

/**文字主色调*/
+ (UIColor *)colorTextMain{
    return [UIColor colorNumericalWithRed:244 green:244 blue:244];
    
    //    return [UIColor colorWithRGBHex:0x2e2e2e];
}

/**导航栏文字颜色*/
+ (UIColor *)colorTextNav{
    return [UIColor colorNumericalWithRed:244 green:244 blue:244];
}

/**Tabbar背景色*/
+ (UIColor *)colorTabbarBG{
    return [UIColor colorWithRGBHex:0xe9e9e9];
}


@end
