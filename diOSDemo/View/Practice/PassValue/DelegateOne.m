//
//  AttibuteOne.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/2.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "DelegateOne.h"
#import "DelegateTwo.h"
@interface DelegateOne ()<FirstDelegate>
@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *button;
@end

@implementation DelegateOne

- (UILabel *)label{
    if (_label == nil) {
        _label = [[UILabel alloc] initWithFrame:(CGRectMake(100, 200, 100, 40))];
        _label.text = @"啦啦啦";
        _label.textColor = [UIColor blackColor];
        _label.backgroundColor = [UIColor grayColor];
    }
    return _label;
}

-(UIButton *)button{
    if (_button == nil) {
        _button = [[UIButton alloc] initWithFrame:CGRectMake(100, 400, 100, 40)];
        
        [_button setBackgroundColor:[UIColor grayColor]];
        [_button setTitle:@"跳转到下一页" forState:(UIControlStateNormal)];
        //        _button.tintColor = [UIColor colorNamed:@"white"];
        [_button setTitleColor:[UIColor whiteColor] forState:(UIControlStateNormal)];
        [_button addTarget:self action:@selector(btnClick) forControlEvents:(UIControlEventTouchUpInside)];
    }
    return _button;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
}

#pragma click
-(void)btnClick{
    DelegateTwo *two = [[DelegateTwo alloc] init];
    two.delegate = self;
    [self presentViewController:two animated:YES completion:nil];
}

#pragma 协议实现
- (void)sendParams:(NSString *)str{
    self.label.text = str;
}

@end