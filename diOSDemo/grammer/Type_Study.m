//
//  Type_Study.m
//  diOSDemo
//
//  Created by mac on 2022/2/14.
//  Copyright © 2022 hl. All rights reserved.
//  OC属于静态类型并且是强类型语言

#import "Type_Study.h"

@implementation Type_Study

void typeTest(){
    stringTest();
    mutableString();
    arrTest();
}


// OC中基本数据类型:int、float、double、char(字符型)
// 字符串是对象
// 当需要使用int类型的变量时，推荐使用NSInteger，这样不需要考虑设备是32位或者64位。
void stringTest(){
    NSString *string1 = @"Hello world";
    // 创建空字符串
    NSString *string2 = [NSString string];
    NSString *string3 = [NSString stringWithFormat:@"%i,%@",1,@"test"];
    
    NSLog(@"string1 = %@,string2 = %@,string3= %@",string1,string2,string3);
    NSLog(@"%@",string3);
    // 参考链接:https://blog.csdn.net/zilan1239/article/details/29610337
}

void mutableString(){
    //创建对象并初始化
    NSMutableString *mStr = [[NSMutableString alloc]init];
    //appendstring：向字符串尾部添加一个字符串。
    //appendFormat：向字符串尾部添加多个类型的字符串，可以添加任意数量与类型的字符串。
    [mStr appendString:@"hello world!"];
    NSLog(@"字符串创建%@", mStr);
    [mStr deleteCharactersInRange:[mStr rangeOfString:@"hello"]];
    //删除
    NSLog(@"字符串删除%@", mStr);
    //插入
    [mStr insertString:@"love you" atIndex: mStr.length];
    NSLog(@"字符串插入%@", mStr);
}

void arrTest(){
    //字面量创建方式
    NSArray *arr2 = @[@"aaa",@"bbbbb"];
    //工厂方法创建
    NSArray *array = [[NSArray alloc] initWithObjects:@"1", @"2", nil];
    //取最后一个元素
    [array lastObject];
    
    //    取第一个元素
    // id是动态类型,可以存储所有类型
    id first = [array firstObject];
    //    数组是否包含某个元素
    [array containsObject:@"1"];
    //    数组的大小
    int count = (int) array.count;
    //    第一种方式遍历
    
    NSLog(@"first=%@,arr2=%@,count=%i",first,arr2,count);
    for (int i = 0; i < count; i++) {
        NSString *_str = [array objectAtIndex:i];
        NSLog(@"%@",_str);
    }
}

@end
