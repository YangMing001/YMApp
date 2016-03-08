//
//  ConCurrentOperation.m
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "ConCurrentOperation.h"

@implementation ConCurrentOperation

@synthesize executing   = _executing;
@synthesize finished    = _finished;

- (instancetype)init{
    if (self = [super init]) {
        _executing  = NO;
        _finished   = NO;
    }
    return self;
}

/**
 *  是否是并发的
 */
- (BOOL)isConcurrent{
    return YES;
}

- (BOOL)isExecuting{
    return _executing;
}

- (BOOL)isFinished{
    return _finished;
}

- (void)start{
    if (self.isCancelled) {
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        return;
    }
    
    [self willChangeValueForKey:@"isExecuting"];
    
    [NSThread detachNewThreadSelector:@selector(main) toTarget:self withObject:nil];
    _executing = YES;
    [self didChangeValueForKey:@"isExecuting"];
}

- (void)main{
    @try {
        BLogWarn(@"Start executing %@  ,mainThread:%@,currentThread:%@",NSStringFromSelector(_cmd),[NSThread mainThread],[NSThread currentThread]);
        sleep(3);
        [self willChangeValueForKey:@"isExecuting"];
        _executing = NO;
        [self didChangeValueForKey:@"isExecuting"];
        
        [self willChangeValueForKey:@"isFinished"];
        _finished = YES;
        [self didChangeValueForKey:@"isFinished"];
        
        BLogWarn(@"finished ---");
    }
    @catch (NSException *exception) {
        BLogWarn(@"exception %@",exception);
    }
    
}

@end
