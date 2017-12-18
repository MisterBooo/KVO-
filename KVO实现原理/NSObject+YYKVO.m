//
//  NSObject+YYKVO.m
//  KVO实现原理
//
//  Created by MisterBooo on 2017/12/18.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "NSObject+YYKVO.h"
#import <objc/message.h>
@implementation NSObject (YYKVO)
- (void)yy_addObserver:(NSObject *)observer forKeyPath:(NSString *)keyPath options:(NSKeyValueObservingOptions)options context:(nullable void *)context{
    
    NSString *oldName = NSStringFromClass([self class]);
    NSString *newName = [@"YYKVO" stringByAppendingString:oldName];
    
    Class MyClass = objc_allocateClassPair([self class], newName.UTF8String, 0);
    class_addMethod(MyClass, @selector(setName:), (IMP)test, "v@:@");
    
    objc_registerClassPair(MyClass);
    
    object_setClass(self, MyClass);
}

void test(){
    NSLog(@"test");
}

@end
