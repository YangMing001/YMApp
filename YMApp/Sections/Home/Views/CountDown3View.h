//
//  CountDown3View.h
//  YMApp
//
//  Created by YM on 16/3/10.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseView.h"
@class CountDown3View;
@protocol CountDown3ViewDelegate <NSObject>

- (void)countDown3Finished;

@end

@interface CountDown3View : BaseView

@property (nonatomic,strong) UILabel *label;

@property (nonatomic,copy) NSString *finishText;

@property (nonatomic,weak) id<CountDown3ViewDelegate> delegate;

- (void)prepareAnimation;

@end
