//
//  AttibuteOne.h
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/2.
//  Copyright © 2019年 hl. All rights reserved.
//

//代理传值使用很广泛的传值，代理传值(一般用于反向传值，通过委托方声明协议，持有协议，跳用协议。然后代理方去实现协议让后传值成功的)。最后必须设置第二个页面的代理为第一个页面
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@interface DelegateOne : UIViewController
@end

NS_ASSUME_NONNULL_END
