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
@interface ViewController ()
//** 描述 */
@property(nonatomic, strong) Person *p;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    Person *p = [[Person alloc] init];
    [p yy_addObserver:self forKeyPath:@"name" options:NSKeyValueObservingOptionNew context:nil];
    self.p = p;

    
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
