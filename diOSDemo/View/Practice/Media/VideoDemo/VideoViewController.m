//
//  VideoViewController.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/8.
//  Copyright © 2019年 hl. All rights reserved.
//

//视频
#import "VideoViewController.h"
#import "AVFoundation/AVFoundation.h"
#import "AVKit/AVKit.h"
#import "MobileCoreServices/MobileCoreServices.h"

@interface VideoViewController ()<UINavigationControllerDelegate,UIImagePickerControllerDelegate>{
    //定义成员变量
    NSURL *videoUrl;
}

@property(nonatomic,strong) UIImagePickerController *picker;
@property(nonatomic,strong) UIButton *btn;
@property (nonatomic,strong) AVPlayerViewController *playVideo;

@end

@implementation VideoViewController

#pragma 懒加载
-(UIImagePickerController *)picker{
    if (!_picker) {
        _picker = [[UIImagePickerController alloc] init];
        
        //采集源类型
        _picker.sourceType = UIImagePickerControllerSourceTypeCamera;
        
        //媒体类型
        _picker.mediaTypes = [NSArray arrayWithObject:(__bridge NSString *)kUTTypeMovie];
        
        _picker.videoQuality = UIImagePickerControllerQualityTypeHigh;
        _picker.delegate = self;
    }
    return _picker;
}

- (AVPlayerViewController *)playVideo{
    if (!_playVideo) {
        _playVideo = [[AVPlayerViewController alloc] init];
        
        //创建AVPlayer对象
        _playVideo.player = [[AVPlayer alloc] initWithURL:videoUrl];
        
        //模态的方式全屏播放
        [self presentViewController:self.playVideo animated:YES completion:nil];
        
        //小屏幕播放就是修改frame
        self.playVideo.view.frame = CGRectMake(200, 100, 300, 400);
        [self.view addSubview:self.playVideo.view];
    }
    return _playVideo;
}

-(UIButton *)btn{
    if (!_btn) {
        _btn = [[UIButton alloc] init];
        
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 100, 300, 50)];
        
        [_btn setTitle:@"录制视频" forState:UIControlStateNormal];
        [_btn setTintColor:[UIColor blackColor]];
        _btn.layer.cornerRadius = 25;
        
        _btn.backgroundColor = [UIColor redColor];
        
        [_btn addTarget:self action:@selector(videoBtn) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (void)viewDidLoad {
    [super viewDidLoad];

    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.btn];
}

#pragma click
-(void) videoBtn{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        NSLog(@"当前摄像头可用");
        [self presentViewController:self.picker animated:true completion:nil];
    }else{
        NSLog(@"当前摄像头不可用");
    }
}

#pragma delegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey, id> *)info{
    //获取媒体类型
    NSString *type = info[UIImagePickerControllerMediaType];
    
    //如果是视频媒体类型，那么就获取视频的URL
    if ([type isEqualToString:(__bridge NSString *)kUTTypeMovie]) {
        videoUrl = info[UIImagePickerControllerMediaURL];
    }
    [self dismissViewControllerAnimated:YES completion:nil];
    
    //录制完成之后播放视频
    [self.playVideo.player play];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:nil];
}

@end
