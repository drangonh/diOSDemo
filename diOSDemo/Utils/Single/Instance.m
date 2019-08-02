//
//  Instance.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/1.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "Instance.h"

@implementation Instance

//单利，利用静态变量能够保持值。
+ (instancetype) getParams{
    static Instance *params = nil;
    if (params == nil) {
        params = [[Instance alloc] init];
    }
    return params;
}

@end
