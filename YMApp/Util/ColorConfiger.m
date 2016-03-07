//
//  ColorConfiger.m
//  YMApp
//
//  Created by YM on 16/3/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "ColorConfiger.h"
#import "UIColor+Tools.h"


@implementation ColorConfiger

/**主色调*/
+ (UIColor *)colorMain{
    return [UIColor colorWithRGBHex:0xf44336];
}

/**view 的背景色*/
+ (UIColor *)colorViewBG{
    return [UIColor colorWithRGBHex:0xd9d9d9];
}

/**文字主色调*/
+ (UIColor *)colorTextMain{
    return [UIColor colorWithRGBHex:0x2e2e2e];
}

/**导航栏文字颜色*/
+ (UIColor *)colorTextNav{
    return [UIColor colorWithRGBHex:0x2e2e2e];
}

/**Tabbar背景色*/
+ (UIColor *)colorTabbarBG{
    return [UIColor colorWithRGBHex:0xe9e9e9];
}

@end
