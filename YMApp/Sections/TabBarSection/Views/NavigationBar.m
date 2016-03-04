//
//  NavigationBar.m
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "NavigationBar.h"
#import <Masonry.h>
#import <FontAwesome.h>
@interface NavigationBar()
{
    UIButton *_leftButton;
    UIButton *_rightButton;
}
@end

@implementation NavigationBar
- (instancetype)init {
    self = [super init];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithFrame:(CGRect)frame {
    self = [super initWithFrame:frame];
    if (self) {
        [self initialization];
    }
    return self;
}

- (id)initWithCoder:(NSCoder *)aDecoder {
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self initialization];
    }
    return self;
}

- (void)initialization {
    [self setupViews];
}

- (void)setupViews{
    self.backgroundColor = [UIColor clearColor];
    _navBackgroundView = [UIView new];
    _navBackgroundView.backgroundColor = [UIColor orangeColor];
    [self addSubview:_navBackgroundView];
    __weak typeof(self) weakSelf = self;
    [self.navBackgroundView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.left.bottom.and.right.equalTo(weakSelf).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
}
#pragma mark -SET

- (void)setRightTitle:(NSString *)rightTitle{
    _rightTitle = rightTitle;
    if (_rightItemView) {
        [_rightItemView removeFromSuperview];
    }
    _rightItemView = [UILabel new];
    [self addSubview:_rightItemView];
    WeakOBJ(weakSelf);
    [_rightItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@90);
        make.height.equalTo(@40);
        make.trailing.equalTo(weakSelf).offset(-10);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    _rightButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_rightButton addTarget:self action:@selector(rightClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_rightButton];
    [_rightButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.rightItemView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    
    ((UILabel *)_rightItemView).font            = [UIFont boldSystemFontOfSize:18];
    ((UILabel *)_rightItemView).textColor       = [UIColor whiteColor];
    ((UILabel *)_rightItemView).shadowColor     = [UIColor redColor];
    ((UILabel *)_rightItemView).shadowOffset    = CGSizeMake(1.0,1.0);
    ((UILabel *)_rightItemView).lineBreakMode   = NSLineBreakByWordWrapping;//截去中间
    ((UILabel *)_rightItemView).textAlignment   = NSTextAlignmentCenter;
    ((UILabel *)_rightItemView).text            = _rightTitle;
}

- (void)setTitle:(NSString *)title{
    _title = title;
    if (_titleView) {
        [_titleView removeFromSuperview];
    }
    _titleView = [UILabel new];
    [self addSubview:_titleView];
    WeakOBJ(weakSelf);
    [_titleView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@150);
        make.centerX.equalTo(weakSelf);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    ((UILabel *)_titleView).font            = [UIFont boldSystemFontOfSize:24];
    ((UILabel *)_titleView).textColor       = [UIColor whiteColor];
    ((UILabel *)_titleView).shadowColor     = [UIColor redColor];
    ((UILabel *)_titleView).shadowOffset    = CGSizeMake(1.0,1.0);
    ((UILabel *)_titleView).lineBreakMode   = NSLineBreakByWordWrapping;//截去中间
    ((UILabel *)_titleView).textAlignment   = NSTextAlignmentCenter;
    ((UILabel *)_titleView).text            = _title;

}

- (void)setLeftTitle:(NSString *)leftTitle{
    _leftTitle = leftTitle;
    if (_leftItemView) {
        [_leftItemView removeFromSuperview];
    }
    if (_leftButton) {
        [_leftButton removeFromSuperview];
    }
    _leftItemView = [UILabel new];
    [self addSubview:_leftItemView];
    WeakOBJ(weakSelf);
    [_leftItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@30);
        make.leading.equalTo(weakSelf).offset(10);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    _leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_leftButton addTarget:self action:@selector(leftClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_leftButton];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.leftItemView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    ((UILabel *)_leftItemView).font            = [UIFont boldSystemFontOfSize:18];
    ((UILabel *)_leftItemView).textColor       = [UIColor whiteColor];
    ((UILabel *)_leftItemView).shadowColor     = [UIColor redColor];
    ((UILabel *)_leftItemView).shadowOffset    = CGSizeMake(1.0,1.0);
    ((UILabel *)_leftItemView).lineBreakMode   = NSLineBreakByWordWrapping;//截去中间
    ((UILabel *)_leftItemView).textAlignment   = NSTextAlignmentCenter;
    ((UILabel *)_leftItemView).text            = _rightTitle;
}

- (void)setLeftType:(NavBarLeftType)leftType{
    _leftType = leftType;
    [_leftButton removeFromSuperview];
    [_leftItemView removeFromSuperview];
    if (leftType != NavBarLeftTypeBack) {
        return;
    }
    
    _leftItemView = [UIImageView new];
    [self addSubview:_leftItemView];
    WeakOBJ(weakSelf);
    [_leftItemView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(@40);
        make.height.equalTo(@30);
        make.leading.equalTo(weakSelf).offset(10);
        make.centerY.equalTo(weakSelf).offset(10);
    }];
    _leftButton = [UIButton buttonWithType:(UIButtonTypeCustom)];
    [_leftButton addTarget:self action:@selector(leftClicked:) forControlEvents:(UIControlEventTouchUpInside)];
    [self addSubview:_leftButton];
    [_leftButton mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(weakSelf.leftItemView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    ((UIImageView *)_leftItemView).contentMode = UIViewContentModeCenter;
    ((UIImageView *)_leftItemView).image = [FontAwesome imageWithIcon:fa_bell iconColor:[UIColor blackColor] iconSize:17];

}

#pragma mark - Actions
- (void)leftClicked:(id)sender{
    if (self.delegate) {
        [self.delegate navBarView:self leftClicked:_leftItemView];
    }
}

- (void)rightClicked:(id)sender{
    if (self.delegate) {
        [self.delegate navBarView:self rightClicked:_rightItemView];
    }
}

@end
