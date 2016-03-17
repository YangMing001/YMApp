//
//  DescribeItemModel.h
//  YMApp
//
//  Created by YM on 16/3/14.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseModel.h"

@interface DescribeItemModel : BaseModel

@property (nonatomic,copy) NSString *descText;  //描述文字

@property (nonatomic,strong) UIColor *descColor; //描述颜色

- (instancetype)initWithDescText:(NSString *)descText desColor:(UIColor *)descColor;

@end
