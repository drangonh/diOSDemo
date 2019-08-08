//
//  AudioViewController.m
//  diOSDemo
//
//  Created by 雨浓科技 on 2019/8/6.
//  Copyright © 2019年 hl. All rights reserved.
//

//录音和播放demo，
//录音先设置录音存放路径，
#import "AudioViewController.h"
#import "AVFoundation/AVFoundation.h"
#import "AVKit/AVKit.h"
@interface AudioViewController ()
@property(nonatomic,strong) UIButton *btn;

@property(nonatomic,strong) UIButton *playbBn;

@property(nonatomic,strong) AVAudioRecorder *recorder;
@property(nonatomic,strong) AVAudioPlayer *player;
@end

@implementation AudioViewController

- (AVAudioRecorder *)recorder{
    if (!_recorder) {
        //设置录音路径
//        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//        // 先创建子目录
//        NSFileManager *fileManager = [NSFileManager defaultManager];
//        if (![fileManager fileExistsAtPath:path]) {
//            NSLog(@"这个文件了");
//            [fileManager createDirectoryAtPath:path withIntermediateDirectories:YES attributes:nil error:nil];
//        }else{
//            NSLog(@"有这个文件了");
//        }
//        NSString *filePath = [path stringByAppendingString:@"/RRecord111.aac"];
        
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/record1.aac"];
        NSMutableDictionary *directory = [[NSMutableDictionary alloc] init];
        //设置采样率
        [directory setValue:[NSNumber numberWithInt:44100] forKey:AVSampleRateKey];
        
        //录音格式
        [directory setValue:[NSNumber numberWithInt:kAudioFormatMPEG4AAC] forKey:AVFormatIDKey];
        
        //录音通道
        [directory setValue:[NSNumber numberWithInt:1] forKey:AVNumberOfChannelsKey];
        
        //录音质量
        [directory setValue:[NSNumber numberWithInt:AVAudioQualityHigh] forKey:AVVideoQualityKey];
    
        _recorder = [[AVAudioRecorder alloc] initWithURL:[NSURL fileURLWithPath:path] settings:directory error:nil];
        [_recorder prepareToRecord];
    }
    return _recorder;
}

- (AVAudioPlayer *)player{
    if (!_player) {
        //设置录音路径
//        NSString *path = [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES) lastObject];
//
//        NSString *filePath = [path stringByAppendingString:@"/RRecord111.mp3"];
        
        
        NSString *path = [NSHomeDirectory() stringByAppendingString:@"/record.aac"];
        //播放本地项目中的文件
//        NSString *path = [[NSBundle mainBundle] pathForResource:@"蓝莲花" ofType:@"mp3"];
        _player = [[AVAudioPlayer alloc] initWithContentsOfURL:[NSURL fileURLWithPath:path] error:nil];
        NSLog(@"%@",path);
        [_player prepareToPlay];
    }
    return _player;
}

- (UIButton *)btn{
    if (_btn == nil) {
        _btn = [[UIButton alloc] initWithFrame:CGRectMake(50, 114, 300, 50)];
        _btn.backgroundColor = [UIColor yellowColor];
        [_btn setTitle:@"录音" forState:UIControlStateNormal];
        [_btn setTitle:@"停止" forState:UIControlStateSelected];
        _btn.layer.cornerRadius = 25;
        [_btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_btn addTarget:self action:@selector(click) forControlEvents:UIControlEventTouchUpInside];
    }
    return _btn;
}

- (UIButton *)playbBn{
    if (_playbBn == nil) {
        _playbBn = [[UIButton alloc] initWithFrame:CGRectMake(50, 214, 300, 50)];
        _playbBn.backgroundColor = [UIColor yellowColor];
        [_playbBn setTitle:@"播放录音" forState:UIControlStateNormal];
        _playbBn.layer.cornerRadius = 25;
        [_playbBn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [_playbBn addTarget:self action:@selector(playClick) forControlEvents:UIControlEventTouchUpInside];
    }
    return _playbBn;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self.view setBackgroundColor:[UIColor whiteColor]];
    
    [self.view addSubview:self.btn];
    [self.view addSubview:self.playbBn];
}

-(void)click{
    if (self.btn.selected == NO) {
        [self.recorder record];
        self.btn.selected = YES;
        
    }else{
        [self.recorder stop];
        self.btn.selected = NO;
    }
}

-(void)playClick{
//    [self.player play];
    if (self.playbBn.selected == NO) {
        NSLog(@"%@",@"播放");
        [self.player play];
        self.playbBn.selected = YES;

    }else{
        NSLog(@"%@",@"停止");
        [self.player stop];
        self.playbBn.selected = NO;
    }
    
}

@end
