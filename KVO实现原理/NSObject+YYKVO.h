//
//  NSObject+YYKVO.h
//  KVO实现原理
//
//  Created by MisterBooo on 2017/12/18.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (YYKVO)
- (void)yy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context;
@end
