//
//  DBManager.h
//  YMApp
//
//  Created by YM on 16/3/8.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DBManager : NSObject

+ (instancetype)manager;

- (void)newDBVersionInit;

@end
