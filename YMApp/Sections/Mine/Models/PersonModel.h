//
//  PersonModel.h
//  YMApp
//
//  Created by YM on 16/3/8.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseModel.h"

@interface PersonModel : BaseModel

@property (nonatomic,copy) NSString *name;

@property (nonatomic,copy) NSString *sex;

@property (nonatomic,copy) NSString *bir;

@property (nonatomic,assign) NSInteger ID;




@end
