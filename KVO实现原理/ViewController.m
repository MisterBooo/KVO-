//
//  ViewController.m
//  KVO实现原理
//
//  Created by MisterBooo on 2017/12/18.
//  Copyright © 2017年 MisterBooo. All rights reserved.
//

#import "ViewController.h"
#import "Person.h"
#import "NSObject+YYKVO.h"
#import <objc/runtime.h>
@interface ViewController ()
//** 描述 */
@property(nonatomic, strong) Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc] init];
   
    self.p = p;
    NSLog(@"***********前***********");
    NSLog(@"self->isa:%@",object_getClass(p));
    NSLog(@"self class:%@",[p class]);
    
    [p addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"***********中***********");
    NSLog(@"self->isa:%@",object_getClass(p));
    NSLog(@"self class:%@",[p class]);

    [p yy_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    NSLog(@"***********后***********");
    NSLog(@"self->isa:%@",object_getClass(p));
    NSLog(@"self class:%@",[p class]);
    
    
//    NSString *string = @"string123456789";
//    NSString *string1 = [NSString stringWithFormat:@"%@",@"11111111111111111"];
//    NSString *string2 = [NSString stringWithFormat:@"%@",@"22222222222222222"];
//    NSString *string3 = [NSString stringWithFormat:@"%@",@"33333333333333333"];
//    id cls = [Person class];
//    void *obj = &cls;
//    [(__bridge id)obj speak];
    
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    NSLog(@"%@",_p.name);
}


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    NSLog(@"touchesBegan");
    static int i = 0;
    i++;
    _p.name = [NSString stringWithFormat:@"%d",i];
}


@end
