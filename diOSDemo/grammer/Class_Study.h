//
//  Class_Study.h
//  diOSDemo
//
//  Created by mac on 2022/2/21.
//  Copyright © 2022 hl. All rights reserved.
//

/**
 类由两个部分组成，分别是定义（interface）和实现（implementation）
 + 表示类方法(静态方法)
 - 表示对象方法(动态方法)
 在.h中声明的所有方法作用域都是public类型，不能更改
 @public 全局都可以访问
 @protected 只能在类内部和子类中访问
 @private 只能在类内部访问
 编译器只会编译.m文件，并不会编译.h文件
 在OC方法中，一个冒号:对应一个参数。
 
 属性
 assign：针对基本数据类型赋值操作。
 strong：定义一种”拥有关系“，属性设置新值时，先保留新值，并释放旧值，然后再将新值设置。
 weak：跟strong相反，属性所指的对象销毁时，属性值也会清空。
 copy：设置方法不保留新值，而是拷贝一份。
 nonatomic：非原子，非线程安全类型。
 
 NSString，NSArray，NSDictonary，推荐使用copy属性，而其NSMubtableString，NSMutableArray, NSMutableDictonary属性则使用strong属性
 */

// 因为NSObject被声明在Foundation.h中，所以在第1行用#import包含了Foundation.h文件。
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Class_Study : NSObject{
    // 成员变量,累内使用
    NSString *_peopleName;
    int _peopleAge;
    int _peopleSex;
}

@property(nonatomic,copy) NSString *peopleName;

- (NSString*)getName;

@end

NS_ASSUME_NONNULL_END
