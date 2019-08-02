//
//  AttributeTwo.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/2.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "DelegateTwo.h"

@interface DelegateTwo ()
@property (nonatomic,strong) UITextField *field;
@property (nonatomic,strong) UIButton *btn;
@end

@implementation DelegateTwo
//懒加载的写法
-(UITextField *)field{
    if (_field == nil) {
        _field = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
        [_field setBorderStyle:UITextBorderStyleLine];
        _field.textColor = [UIColor blackColor];
        //属性传值
        _field.text = self.str;
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
    //用代理测试一下反向传值
    [self.delegate sendParams:self.field.text];
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.field];
    [self.view addSubview:self.btn];
}

@end
