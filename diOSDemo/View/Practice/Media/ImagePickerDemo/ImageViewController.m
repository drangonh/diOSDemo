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
#import "SCRFTPRequest.h"

@interface ImageViewController ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate,SCRFTPRequestDelegate>{
    //定义成员变量
    SCRFTPRequest *scrRequest;
    NSString *filePath;
}

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
        
        //上传图片到本电脑配置的ftp服务器上
        [self uploadImage:image str:@"测试传递多个参数"];
    }
    [self dismissViewControllerAnimated:true completion:nil];
}

//图片上传
-(void)uploadImage:(UIImage *)image str:(NSString *)str{

    //创建目录
    NSString *pathStr = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/demoImg.jpg"];
    filePath = pathStr;
    NSLog(@"%@",pathStr);
    NSFileManager *filemanager = [[NSFileManager alloc] init];
    
    if (![filemanager fileExistsAtPath:pathStr]) {
        [filemanager createFileAtPath:pathStr contents:nil attributes:nil];
        
//        [filemanager createDirectoryAtPath:pathStr withIntermediateDirectories:NO attributes:nil error:nil];
    }
    
    //创建沙河中的图片文件
    NSData *data = UIImageJPEGRepresentation(image, 0.3);
    [filemanager createFileAtPath:filePath contents:data attributes:nil];
    
    //上传到FTP服务器
    NSLog(@"%@",filePath);
    
    //这里报错了，无法连接本地Mac的ftp服务器，问题暂时没有解决
    scrRequest = [[SCRFTPRequest alloc] initWithURL:[NSURL URLWithString:@"ftp://192.168.3.15/Desktop/"] toUploadFile:filePath];
    scrRequest.delegate =self;
    [scrRequest setName:@"雨浓科技"];
    [scrRequest setPassword:@"yn666666"];
    [scrRequest startRequest];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:true completion:nil];
}


#pragma delegate
- (void)ftpRequestDidFinish:(SCRFTPRequest *)request{
    NSLog(@"上传完成");
//    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}
/** Called on the delegate when the request fails. */
- (void)ftpRequest:(SCRFTPRequest *)request didFailWithError:(NSError *)error{
    NSLog(@"上传失败:%@",[error localizedDescription]);
//    [[NSFileManager defaultManager] removeItemAtPath:filePath error:nil];
}

/** Called on the delegate when the transfer is about to start. */
- (void)ftpRequestWillStart:(SCRFTPRequest *)request{
    NSLog(@"开始上传");
}
/** Called on the delegate when the status of the request instance changed. */
- (void)ftpRequest:(SCRFTPRequest *)request didChangeStatus:(SCRFTPRequestStatus)status{
    switch (status) {
        case SCRFTPRequestStatusError:
            NSLog(@"SCRFTPRequestStatusError");
            break;
            
        default:
            NSLog(@"各种状态");
            break;
    }
}
/** Called on the delegate when some amount of bytes were transferred. */
- (void)ftpRequest:(SCRFTPRequest *)request didWriteBytes:(NSUInteger)bytesWritten{
    NSLog(@"压缩了多少字节：%lu",bytesWritten);
}
@end
