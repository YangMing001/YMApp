//
//  NSString+URLCodec.h
//  YMApp
//
//  Created by YM on 16/3/16.
//  Copyright © 2016年 YM. All rights reserved.
//

#import <Foundation/Foundation.h>

/**URL编解码*/
@interface NSString (URLCodec)

/**解码*/
- (NSString *)URLDecodedString;

/**编码*/
- (NSString *)URLEncodedString;


@end
