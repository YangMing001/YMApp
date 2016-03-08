//
//  NonConcurrentOperation.h
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  非并发 Operation
 */
@interface NonConcurrentOperation : NSOperation


- (instancetype)initWithData:(id)data;


@end
