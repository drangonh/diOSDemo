//
//  AttributeTwo.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/2.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "SingleTwo.h"
#import "Instance.h"
@interface SingleTwo ()
@property (nonatomic,strong) UITextField *field;
@property (nonatomic,strong) UIButton *btn;
@end

@implementation SingleTwo
//懒加载的写法
-(UITextField *)field{
    if (_field == nil) {
        _field = [[UITextField alloc] initWithFrame:CGRectMake(50, 100, 200, 50)];
        [_field setBorderStyle:UITextBorderStyleLine];
        _field.textColor = [UIColor blackColor];
        //单例传值
        _field.text = [Instance getParams].str;
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
    //单例反向传值
    [Instance getParams].str = self.field.text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.field];
    [self.view addSubview:self.btn];
}

@end
