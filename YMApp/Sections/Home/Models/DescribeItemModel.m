//
//  DescribeItemModel.m
//  YMApp
//
//  Created by YM on 16/3/14.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "DescribeItemModel.h"

@implementation DescribeItemModel

- (instancetype)initWithDescText:(NSString *)descText desColor:(UIColor *)descColor{
    if (self = [super init]) {
        _descColor  = descColor;
        _descText   = descText;
    }
    return self;
}

@end
