//
//  NonConcurrentOperation.m
//  YMApp
//
//  Created by YM on 16/3/7.
//  Copyright © 2016年 YM. All rights reserved.
//

#import "NonConcurrentOperation.h"

@interface NonConcurrentOperation ()

@property (nonatomic,strong) id data;

@end

@implementation NonConcurrentOperation

- (instancetype)initWithData:(id)data{
    if (self = [super init]) {
        _data = data;
    }
    return self;
}

- (void)main{
    @try {
        //开始前检查 isCancelled 如果为YES  则什么操作都不做
        if (self.isCancelled) {
            return;
        }
        
        BLogWarn(@"Start executing %@  ,mainThread:%@,currentThread:%@",NSStringFromSelector(_cmd),[NSThread mainThread],[NSThread currentThread]);
        
        for (NSUInteger i = 0 ; i < 3 ; i++ ) {
            if (self.isCancelled) {
                return;
            }
            sleep(1);
            BLogWarn(@"loop %@",@(i+1));
        }
        BLogWarn(@"Finish executing %@",NSStringFromSelector(_cmd));
    }
    @catch (NSException *exception) {
        BLogWarn(@"exception %@",exception.description);
    }
    
}

@end
