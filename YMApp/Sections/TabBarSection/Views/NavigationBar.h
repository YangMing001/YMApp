//
//  NavigationBar.h
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseView.h"

typedef NS_ENUM(NSUInteger, NavBarLeftType) {
    NavBarLeftTypeDefault,
    NavBarLeftTypeBack
};

@class NavigationBar;
@protocol NavigationBarDelegate <NSObject>

- (void)navBarView:(NavigationBar *)navBarView leftClicked:(id)sender;

- (void)navBarView:(NavigationBar *)navBarView rightClicked:(id)sender;

@end

@interface NavigationBar : BaseView


/** *  背景View*/
@property (nonatomic,strong) UIView *navBackgroundView;

/** *  左item视图*/
@property (nonatomic,strong) UIView *leftItemView;

/***  右item视图*/
@property (nonatomic,strong) UIView *rightItemView;

/***  标题View*/
@property (nonatomic,strong) UIView *titleView;

@property (nonatomic,copy) NSString *leftTitle;

@property (nonatomic,copy) NSString *rightTitle;

@property (nonatomic,copy) NSString *title;

@property (nonatomic,assign) NavBarLeftType leftType;


@property (nonatomic,weak) id<NavigationBarDelegate> delegate;

@end
