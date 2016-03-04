//
//  Tools.h
//  YMApp
//
//  Created by YM on 16/3/4.
//  Copyright © 2016年 YM. All rights reserved.
//

#ifndef Tools_h
#define Tools_h

/***/
#define WeakOBJ(weakSelf)      __weak typeof(self) (weakSelf) = self;
#define StrongOBJ(strongSelf)  __strong typeof(weakSelf) (strongSelf) = weakSelf;


#endif /* Tools_h */
