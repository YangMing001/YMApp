//
//  InvocationOperation.h
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**简单 InvocationOperation 封装*/
@interface InvocationOperation : NSInvocationOperation

- (NSInvocationOperation *)invocationOperationWithData:(id)data;

- (NSInvocationOperation *)invocationOperationWithData:(id)data userInfo:(NSString *)userInfo;


@end
