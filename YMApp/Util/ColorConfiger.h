//
//  ColorConfiger.h
//  YMApp
//
//  Created by YM on 16/3/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>


/**颜色 配置文件*/
@interface ColorConfiger : NSObject

/**主色调*/
+ (UIColor *)colorMain;

/**view 的背景色*/
+ (UIColor *)colorViewBG;

 /**文字主色调*/
+ (UIColor *)colorTextMain;

/**导航栏文字颜色*/
+ (UIColor *)colorTextNav;

/**Tabbar背景色*/
+ (UIColor *)colorTabbarBG;

@end
