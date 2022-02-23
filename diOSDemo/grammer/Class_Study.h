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
 
 
 id和instancetype的区别?
 区别1:
 在ARC(Auto Reference Count)环境下:
 instancetype用来在编译期确定实例的类型,而使用id的话,编译器不检查类型, 运行时检查类型.
 在MRC(Manual Reference Count)环境下:
 instancetype和id一样,不做具体类型检查

 区别2:
 id可以作为方法的参数,但instancetype不可以
 instancetype只适用于初始化方法和便利构造器的返回值类型
 链接：https://www.jianshu.com/p/bd913b3a8e93
 
 
 alloc 与 init合起来称为构造方法，表示构造一个对象
 alloc 方法为对象分配存储空间，并将所分配这一块区域全部清0.
 
 
 @property
 @property是编译器的指令
 @property 用在声明文件中告诉编译器声明成员变量的的访问器(getter/setter)方法
 
 OC 中self. 与 下划线的区别?
 @property (nonatomic, copy) NSString *name;
 self.name  是对属性的访问   是在调用一个getter方法   会让引用计数器＋1;   _name却不会。
 _name  是对局部变量的访问   引用计数不会增减
 用self.name 是更好的选择，因为这样可以兼容懒加载，同时也避免了使用下划线的时候忽视了self这个指针，_name容易在block中造成循环引用。
 
 SEL类型?
 SEL类型代表着方法的签名,每个方法都有一个与之对应的SEL类型的对象,根据一个SEL对象就可以找到方法的地址，进而调用方法
 
 检验对象是否实现了某个方法
 - (BOOL) respondsToSelector: (SEL)selector 判断实例是否实现这样方法
 + (BOOL)instancesRespondToSelector:(SEL)aSelector;
 
 
 让对象执行某个方法
 - (id)performSelector:(SEL)aSelector;
 - (id)performSelector:(SEL)aSelector withObject:(id)object;
 - (id)performSelector:(SEL)aSelector withObject:(id)object1 withObject:(id)object2;
 参考链接：https://blog.csdn.net/kyl282889543/article/details/93864984
 
 
 继承
 同Java一样只能单继承，只允许最多有一个直接父类。例如：定义一个父类Computer和子类MacBook。注意方法重写类似Java，子类要重写父类方法不需要重新声明重写方法，在实现部分直接重写目标方法即可。如果需要子类调用父类的方法，可以通过super关键字调用。
 
 
 多态
 封装、继承和多态是面向对象编程语言的三大特性，OC的多态是不同对象对同一消息的不同响应方式，实际过程主要分为三种：
 继承
 重写
 指向子类的指针指向父类
 可以看出跟Java的多态类似，理解起来应该比较容易，注意是没有方法重载的，在OC中不允许。
 
 
 Category（类别）
 用以帮助达到分解代码的目的。类别主要特点是不能增加属性或者成员变量、增加类功能和分离类实现，举个例子: 在UIImageView增加了图片异步加载的功能
 
 
 strong/weak/assgin最佳实践
 基本类型：assgin；
 delegate->week;
 集合和block用copy；
 其他用strong；
 block中的self用weak打破循环引用。
 */

// 因为NSObject被声明在Foundation.h中，所以在第1行用#import包含了Foundation.h文件。
#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Class_Study : NSObject{
    // 成员变量,类内使用
//    NSString *_peopleName;
    int _peopleAge;
    int _peopleSex;
}

@property(nonatomic,copy) NSString *peopleName;

- (NSString*)getName;

@end

NS_ASSUME_NONNULL_END
