//
//  BlockOperation.m
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "BlockOperation.h"

@implementation BlockOperation

- (NSBlockOperation *)blockOperation{
    NSBlockOperation *op = [NSBlockOperation blockOperationWithBlock:^{
        BLogWarn(@"Start executing block1 ,mainThread:%@,currentThread:%@",[NSThread mainThread],[NSThread currentThread]);
        sleep(3);
        BLogWarn(@"Finish executing block1");
    }];
    
    [op addExecutionBlock:^{
        BLogWarn(@"Start executing block2  ,mainThread:%@,currentThread:%@",[NSThread mainThread],[NSThread currentThread]);
        sleep(3);
        BLogWarn(@"Finish executing block2");
    }];
    
    [op addExecutionBlock:^{
        BLogWarn(@"Start  block3 ,mainThread:%@,currentThread:%@",[NSThread mainThread],[NSThread currentThread]);
        sleep(3);
        BLogWarn(@"Finish executing block3");
    }];
    
    return op;
}

@end
