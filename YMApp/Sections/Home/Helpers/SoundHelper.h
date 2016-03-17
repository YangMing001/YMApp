//
//  SoundHelper.h
//  YMApp
//
//  Created by YM on 16/3/15.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BaseHelper.h"

@interface SoundHelper : BaseHelper

+ (NSString *)FireworkPatk;


@property (nonatomic,copy) NSString *soundPath;

- (instancetype)initWithSoundPath:(NSString *)path;

- (void)play;

- (void)stop;

@end
