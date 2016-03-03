//
//  ControllerModel.h
//  YMApp
//
//  Created by YM on 16/3/3.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseModel.h"
#import <UIKit/UIKit.h>
@interface ControllerModel : BaseModel

@property (nonatomic,strong) UIViewController *controller;

@property (nonatomic,strong) UIImage *normalImage;

@property (nonatomic,strong) UIImage *selectImage;

@end
