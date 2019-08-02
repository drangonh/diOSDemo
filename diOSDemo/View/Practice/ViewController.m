//
//  ViewController.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/7/31.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "ViewController.h"
#import "NextViewController.h"
#import "Instance.h"
@interface ViewController ()<Merchants>

@property (nonatomic,strong) UILabel *label;
@property (nonatomic,strong) UIButton *button;

@end

@implementation ViewController

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

- (void) btnClick{
    NextViewController *nextVc = [[NextViewController alloc] init];
    //属性传值
    //nextVc.str = @"试试";
    
    //单例传值--相当于js中的全局变量
    //[Instance getParams].str = @"单利传值";
    
    //NSUserDefaults传值相当于js中的缓存，缓存到磁盘中
   // [[NSUserDefaults standardUserDefaults] setObject:@"你好" forKey:@"NSUser"];
    //存入之后还要让它生效
    //[[NSUserDefaults standardUserDefaults] synchronize];
    
    //代理传值设置第二个页面的代理为第一个页面
    nextVc.delegete = self;
    [self presentViewController:nextVc animated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    self.navigationItem.title = @"英雄联盟";
//    self.navigationItem.prompt = @"你！准备好了吗？";
    
//    UILabel* show = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, self.view.frame.size.width, 20)];
//    show.text = @"展示你的实力吧";
//    show.textColor = [UIColor blueColor];
//    show.textAlignment = NSTextAlignmentCenter;
//    self.navigationItem.titleView = show;
    
    [self.view addSubview:self.label];
    [self.view addSubview:self.button];
}

-(void)viewWillAppear:(BOOL)animated{
    //接收单例反向传值
//    self.label.text = [Instance getParams].str;
    
    //接收NSUserDefaults反向传值
//   self.label.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"NSUserBack"];
}


#pragma 实现协议

//Merchants协议实现
- (void)sendParams:(NSString *)str{
    self.label.text = str;
}

@end
