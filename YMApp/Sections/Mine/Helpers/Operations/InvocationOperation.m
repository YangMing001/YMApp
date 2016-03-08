//
//  InvocationOperation.m
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "InvocationOperation.h"

@implementation InvocationOperation

- (NSInvocationOperation *)invocationOperationWithData:(id)data{
    
    return [[NSInvocationOperation alloc] initWithTarget:self selector:@selector(myTaskMethod1:) object:data];
}

- (NSInvocationOperation *)invocationOperationWithData:(id)data userInfo:(NSString *)userInfo{
    NSInvocationOperation *op = [self invocationOperationWithData:data];
    if (userInfo.length > 0) {
        op.invocation.selector = @selector(myTaskMethod2:);
    }
    return op;
}


- (void)myTaskMethod1:(id )data{
    BLogWarn(@"Start executing %@ with data: %@,mainThread:%@,currentThread:%@",NSStringFromSelector(_cmd),data,[NSThread mainThread],[NSThread currentThread]);
    sleep(3);
    BLogWarn(@"Finish executing %@",NSStringFromSelector(_cmd));
}

- (void)myTaskMethod2:(id )data{
    BLogWarn(@"Start executing %@ with data: %@,mainThread:%@,currentThread:%@",NSStringFromSelector(_cmd),data,[NSThread mainThread],[NSThread currentThread]);
    sleep(3);
    BLogWarn(@"Finish executing %@",NSStringFromSelector(_cmd));
}

@end
