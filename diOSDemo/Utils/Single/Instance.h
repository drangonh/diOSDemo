//
//  Instance.h
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/1.
//  Copyright © 2019年 hl. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Instance : NSObject

+ (instancetype) getParams;

@property(nonatomic,strong) NSString *str;

@end

NS_ASSUME_NONNULL_END
