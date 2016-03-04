//
//  TabBar.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "TabBar.h"

@interface TabBar ()
{
    UIButton                *_currentBtn;
    NSArray<UIButton *>     *_btnArray;
}


@end

@implementation TabBar

- (instancetype)initWithImages:(NSArray<ControllerModel *> *)images{
    if (self = [super init]) {
        [self configTabbarWithImages:images];
    }
    return self;
}

- (void)configTabbarWithImages:(NSArray<ControllerModel *> *)images{
    [self setBackgroundColor:[UIColor yellowColor]];
    
    NSInteger imageCount = images.count;
    NSMutableArray *tempBtnArray = [NSMutableArray array];
    
    for (int i = 0; i < imageCount ; i++ ) {

        ControllerModel *model = images[i];
        UIButton *btn = [UIButton buttonWithType:(UIButtonTypeCustom)];
        [self addSubview:btn];
        [btn addTarget:self action:@selector(clicked:) forControlEvents:UIControlEventTouchUpInside];
        [btn setImage:model.normalImage forState:UIControlStateNormal];
        [btn setImage:model.selectImage forState:UIControlStateSelected];
        
         __weak UIButton *lastBtn = [tempBtnArray lastObject];
        if (i == 0) {
            btn.selected = YES;
            _currentBtn = btn;
        }

        WeakOBJ(weakSelf);
        [btn mas_makeConstraints:^(MASConstraintMaker *make) {
            StrongOBJ(strongSelf);
            make.top.and.bottom.equalTo(strongSelf);
            make.width.mas_equalTo(strongSelf.mas_width).multipliedBy(1.0/imageCount);
            make.left.equalTo(lastBtn?lastBtn.mas_right:strongSelf);
        }];
        [tempBtnArray addObject:btn];
    }
    _btnArray = tempBtnArray;
}

- (void)clicked:(UIButton *)btn{
    if (_currentBtn == btn) {
        return;
    }
    
    _currentBtn.selected = NO;
    _currentBtn = btn;
    _currentBtn.selected = YES;
    [self imgAnimate:_currentBtn withComplete:^{}];
    if (self.delegate) {
        NSUInteger index = [_btnArray indexOfObject:_currentBtn];
        [self.delegate setSelectedIndex:index];
    }
}


- (void)imgAnimate:(UIButton*)btn withComplete:(void (^)())complete{
    
    UIView *view=btn.subviews[0];
    
    [UIView animateWithDuration:0.1 animations:
     ^(void){
         view.transform = CGAffineTransformScale(CGAffineTransformIdentity,0.5, 0.5);
     } completion:^(BOOL finished){//do other thing
         [UIView animateWithDuration:0.2 animations:
          ^(void){
              view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1.2, 1.2);
          } completion:^(BOOL finished){//do other thing
              [UIView animateWithDuration:0.1 animations:
               ^(void){
                   view.transform = CGAffineTransformScale(CGAffineTransformIdentity,1,1);
               } completion:^(BOOL finished){//do other thing
                   complete();
               }];
          }];
     }];
}

@end
