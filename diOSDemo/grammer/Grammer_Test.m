//
//  Grammer_Test.m
//  diOSDemo
//
//  Created by mac on 2022/2/22.
//  Copyright © 2022 hl. All rights reserved.
//

#import "Grammer_Test.h"
#import "Type_Study.h"
#import "Class_Study.h"

@implementation Grammer_Test

/**
 集中测试语法例子
 */
- (void)grammerTest{
    [self classTest];
    [self typeTest];
}

- (void) typeTest{
    Type_Study *t = [[Type_Study alloc] init];
    [t typeTest];
}

/**
 类使用测试
*/
- (void)classTest{
    Class_Study *c = [[Class_Study alloc] init];
    
    NSLog(@"%@",c.peopleName);
}

@end
