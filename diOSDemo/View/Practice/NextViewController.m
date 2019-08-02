//
//  NextViewController.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/1.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "NextViewController.h"
#import "Instance.h"
@interface NextViewController ()

@property (nonatomic,strong) UITextField *field;
@property (nonatomic,strong) UIButton *btn;
@end

@implementation NextViewController
//懒加载的写法
-(UITextField *)field{
    if (_field == nil) {
        _field = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
        [_field setBorderStyle:UITextBorderStyleLine];
        _field.textColor = [UIColor blackColor];
        //属性传值
//        -_field.text = self.str;
        
        //单利传值
        //_field.text = [Instance getParams].str;
        
        //NSUserDefaults 传值
        //_field.text = [[NSUserDefaults standardUserDefaults] objectForKey:@"NSUser"];
    }
    return _field;
}

-(UIButton *)btn{
    if (!_btn){
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 400, 200, 50)];
        _btn.backgroundColor = [UIColor yellowColor];
        [_btn setTitle:@"返回上个页面" forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(clickBtn) forControlEvents:(UIControlEventTouchUpInside)];

    }
    return _btn;
}

- (void)clickBtn{
    //因为下面的传值会以最后一个进行覆盖，所以没有注释
    //单例反向传值
    [Instance getParams].str = self.field.text;
    
    //NSUserDefaults 反向传值
//    [[NSUserDefaults standardUserDefaults] setObject:@"反向传值" forKey:@"NSUserBack"];
//    [[NSUserDefaults standardUserDefaults] synchronize];
    
    //代理传值
    [self.delegete sendParams:self.field.text];
    
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.field];
    [self.view addSubview:self.btn];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
