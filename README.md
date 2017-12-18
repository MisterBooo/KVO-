# KVO-
KVO实现原理

```
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
```
