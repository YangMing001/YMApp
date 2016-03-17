//
//  DescribeBarHelper.m
//  YMApp
//
//  Created by YM on 16/3/14.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "DescribeBarHelper.h"




@implementation DescribeBarHelper
+ (NSArray<DescribeItemModel *> *)showModels{

    UIColor *color1 = [UIColor colorWithRed:91.0/255.0 green:181.0/255.0 blue:235.0/255.0 alpha:1];
     UIColor *color2 = [UIColor colorWithRed:139.0/255.0 green:208.0/255.0 blue:124.0/255.0 alpha:1];
    UIColor *color3 = [UIColor colorWithRed:232.0/255.0 green:221.0/255.0 blue:95.0/255.0 alpha:1];
    UIColor *color4 = [UIColor colorWithRed:233.0/255.0 green:126.0/255.0 blue:90.0/255.0 alpha:1];
    UIColor *color5 = [UIColor colorWithRed:234.0/255.0 green:70.0/255.0 blue:70.0/255.0 alpha:1];
    
    
    
    DescribeItemModel *model1 = [[DescribeItemModel alloc] initWithDescText:@"偏瘦" desColor:color1];
    DescribeItemModel *model2 = [[DescribeItemModel alloc] initWithDescText:@"正常" desColor:color2];
    DescribeItemModel *model3 = [[DescribeItemModel alloc] initWithDescText:@"偏胖" desColor:color3];
    DescribeItemModel *model4 = [[DescribeItemModel alloc] initWithDescText:@"肥胖" desColor:color4];
    DescribeItemModel *model5 = [[DescribeItemModel alloc] initWithDescText:@"极胖" desColor:color5];
    return  @[model1,model2,model3,model4,model5];
}

@end
