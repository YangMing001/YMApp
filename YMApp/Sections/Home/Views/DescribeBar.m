//
//  DescribeBar.m
//  YMApp
//
//  Created by YM on 16/3/14.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "DescribeBar.h"

NSInteger const kspace = 5;

@interface DescribeBar ()
{
    NSArray<UILabel *> *_labelArray;     //所有的Label
}
@end

@implementation DescribeBar

- (instancetype)initWithItems:(NSArray<DescribeItemModel *> *)items{
    if (self  = [super init]) {
        [self setItems:items];
    }
    return self;
}

- (void)setItems:(NSArray *)items{
    _items = items;
    NSMutableArray *tempLabelArray = [NSMutableArray array];
    _labelArray = nil;
    for (DescribeItemModel *item in _items) {
        UILabel *label = [[UILabel alloc] init];
        label.text = item.descText;
        label.textColor = [UIColor whiteColor];
        label.font = [UIFont systemFontOfSize:15];
        label.backgroundColor = item.descColor;
        label.textAlignment = NSTextAlignmentCenter;
        [self addSubview:label];
        [tempLabelArray addObject:label];
    }
    _labelArray = tempLabelArray;
}

- (void)layoutSubviews{
    CGFloat multiplieNumber = 1;
    
    NSInteger count = _labelArray.count;
    UILabel *lastLabel;
    for (int i = 0; i < count; i++) {
        UILabel *label = _labelArray[i];
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerY.equalTo(self).multipliedBy(multiplieNumber);
            make.height.mas_equalTo(self.mas_height).multipliedBy(multiplieNumber).offset(-kspace);
            make.width.equalTo(self).multipliedBy(1.0/(count)).offset(-kspace);
            if (lastLabel) {
                make.left.mas_equalTo(lastLabel.mas_right);
            }else{
                make.left.equalTo(self);
            }
        }];
        
        if (i == _selectIndex) {
            
            
            [label mas_updateConstraints:^(MASConstraintMaker *make) {
                make.height.equalTo(self).multipliedBy(multiplieNumber);
                
                make.width.equalTo(self).multipliedBy(1.0/(count)).offset(kspace*(count - 3));
                if (i == 0) {
                    make.left.equalTo(self).offset(kspace);
                    UILabel *rightLabel = _labelArray[i+1];
                    make.right.mas_equalTo(rightLabel.mas_left).offset(-kspace) ;
                    [rightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.left.mas_equalTo(label.mas_right).offset(kspace);
                    }];
                }else{
                    UILabel *tempFirstLabel =  _labelArray[i - 1];
                    make.left.mas_equalTo(tempFirstLabel.mas_right).offset(kspace);
                    [tempFirstLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                        make.right.mas_equalTo(label.mas_left).offset(-kspace);
                    }];
                    if (i < count -1) {
                        UILabel *rightLabel = _labelArray[i+1];
                        make.right.mas_equalTo(rightLabel.mas_left).offset(-kspace) ;
                        [rightLabel mas_updateConstraints:^(MASConstraintMaker *make) {
                            make.left.mas_equalTo(label.mas_right).offset(kspace);
                        }];
                    }
                }
            }];
        }
        lastLabel = label;
    }
}





@end
