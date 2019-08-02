//
//  AttributeTwo.h
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/2.
//  Copyright © 2019年 hl. All rights reserved.
//
//block一般定义为copy属性防止循环应用，void是代表没有返回值。block可以传递多个参数
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//block方法
typedef void (^test) (NSString *str,NSString *two);
@interface BlockTwo : UIViewController
@property (nonatomic,strong) NSString *str;


//block属性
@property (copy)void (^block)(NSString *str,NSString *two);

//block方法
-(void)testBlockFunc:(test)block;
@end

NS_ASSUME_NONNULL_END
