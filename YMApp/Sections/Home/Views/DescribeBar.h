//
//  DescribeBar.h
//  YMApp
//
//  Created by YM on 16/3/14.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseView.h"
#import "DescribeBarHelper.h"
/**说明条*/
@interface DescribeBar : BaseView

@property (nonatomic,copy) NSArray *items;

@property (nonatomic,assign) NSInteger selectIndex;

- (instancetype)initWithItems:(NSArray<DescribeItemModel *> *)items;

@end
