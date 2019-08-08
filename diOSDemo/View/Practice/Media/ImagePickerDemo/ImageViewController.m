//
//  ImageViewController.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/5.
//  Copyright © 2019年 hl. All rights reserved.
//

#import "ImageViewController.h"
#import "MobileCoreServices/MobileCoreServices.h"
#import "AVFoundation/AVFoundation.h"
#import "AVKit/AVKit.h"

@interface ImageViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@property(nonatomic,strong) UIImagePickerController *imagePicker;
@property(nonatomic,strong) UIButton *btn;
@property(nonatomic,strong) UIImageView *imageV;

@end

@implementation ImageViewController

#pragma 懒加载创建视图

- (UIImagePickerController *)imagePicker{
    if (! _imagePicker) {
        _imagePicker = [[UIImagePickerController alloc] init];
        
        //设置类型
        _imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        
        //设置媒体类型
        _imagePicker.mediaTypes = [NSArray arrayWithObject:(__bridge NSString *)kUTTypeImage];
        
        //设置代理
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}

- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 114, 300, 50)];
        _btn.backgroundColor = [UIColor yellowColor];
        [_btn setTitle:@"选择图片" forState:UIControlStateNormal];
        _btn.layer.cornerRadius = 25;
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

-(UIImageView *)imageV{
    if (!_imageV) {
        _imageV = [[UIImageView alloc] initWithFrame:CGRectMake(50, 224, 300, 400)];
        _imageV.backgroundColor = [UIColor grayColor];
    }
    return _imageV;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.btn];
    [self.view addSubview:self.imageV];
}

#pragma click
-(void)click{
    //  判断采集器的类型是否可用，先判断相机
    if ([UIImagePickerController availableMediaTypesForSourceType:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
    }else{
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    }
    
    [self presentViewController:self.imagePicker animated:true completion:nil];
    
}

#pragma delegate
//完成采集图片后的回调处理
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
    //判断info的类型
    NSString *type = info[UIImagePickerControllerMediaType];
    if ([type isEqualToString:(__bridge NSString *)kUTTypeImage]) {
        //  获取采集到的图片
        UIImage *image = info[UIImagePickerControllerOriginalImage];
        self.imageV.image = image;
    }
    [self dismissViewControllerAnimated:true completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:true completion:nil];
}

@end
