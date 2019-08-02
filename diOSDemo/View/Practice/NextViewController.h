//
//  NextViewController.h
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/1.
//  Copyright © 2019年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

//代理传值(一般用于反向传值，通过委托方声明协议，持有协议，跳用协议。然后代理方去实现协议让后传值成功的)。最后必须设置第二个页面的代理为第一个页面

//声明协议
@protocol Merchants <NSObject>

-(void)sendParams:(NSString *) str;

@end

@interface NextViewController : UIViewController

//属性传值
@property (nonatomic,strong) NSString *str;

//代理一般用weak，防止循环引用。这里声明一个id指针，指针名字为delegate（可以随便取）
@property (weak)id <Merchants>delegete;
@end

NS_ASSUME_NONNULL_END
