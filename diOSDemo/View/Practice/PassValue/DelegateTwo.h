//
//  AttributeTwo.h
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/2.
//  Copyright © 2019年 hl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@protocol FirstDelegate <NSObject>

-(void)sendParams: (NSString *)str;

@end
@interface DelegateTwo : UIViewController
@property (nonatomic,strong) NSString *str;
//delegate是指针id的名字，可以随便取
@property(weak)id <FirstDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
