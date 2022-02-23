//
//  Class_Study.m
//  diOSDemo
//
//  Created by mac on 2022/2/21.
//  Copyright © 2022 hl. All rights reserved.
//

// 因为Class_Study这个类是声明在Class_Study.h中的，所以在第1行用#import包含了Class_Study.h文件。
#import "Class_Study.h"

@implementation Class_Study

- (NSString *) getName{
    return _peopleName;
}

/**
 自定义构造方法的使用注意
 (1)自己做自己的事情
 (2)父类的属性交给父类的方法来处理,子类的方法处理子类自己独有的属性

 自定义构造方法必须以intiWith开头,并且’W’必须大写
 */
- (id) init{
    self = [super init];
    if (self) {
        //字符串前加@是为了区分c语言的字符串
        [self setPeopleName:@"dragonh"];
    }
    
    return self;
}

@end
