//
//  CircleHalf.m
//  YMApp
//
//  Created by YM on 16/3/15.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "CircleHalf.h"

@interface CircleHalf ()
{
    CALayer *backLayer;
    CALayer *frontLayer;
    CALayer *maskLayer;
}
@end

@implementation CircleHalf

- (instancetype)init{
    if (self = [super init]) {
        [self prepareLayers];
    }
    return self;
}

/**初始化必要的 Layer*/
- (void)prepareLayers{
    
}


- (void)layoutSublayersOfLayer:(CALayer *)layer{
    
}

@end
