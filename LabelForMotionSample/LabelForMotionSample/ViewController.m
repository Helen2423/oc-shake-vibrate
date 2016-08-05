//
//  ViewController.m
//  LabelForMotionSample
//
//  Created by Dolice on 2013/06/17.
//  Copyright (c) 2013年 Dolice. All rights reserved.
//

#import "ViewController.h"


@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    //ラベル初期化
    UILabel *label = [[UILabel alloc] init];
    label.frame = self.view.bounds;
    label.autoresizingMask =
        UIViewAutoresizingFlexibleWidth |
        UIViewAutoresizingFlexibleHeight;
    label.textAlignment = NSTextAlignmentCenter;
    label.text = @"シェイクしてください";
    
    //ラベルを画面に追加
    [self.view addSubview:label];
    
    //レスポンダ登録
    [label becomeFirstResponder];
}

-(void)vibrate {
    //调用手机震动
    //step1:添加AudioToolbox.framwork框架
    //step2:#import <AudioToolbox/AudioToolbox.h>
    //step3:AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
    
//    AudioServicesPlayAlertSound(kSystemSoundID_Vibrate);
    AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
}

//モーション開始時のイベント 摇一摇
- (void)motionBegan:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    [self vibrate];
    NSLog(@"motionBegan");
}

//モーション終了時のイベント
- (void)motionEnded:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionEnded");
    
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:nil
                                                    message:@"シェイクされました"
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                          otherButtonTitles:@"OK", nil];
    [alert show];
}

//モーションキャンセル時のイベント
- (void)motionCancelled:(UIEventSubtype)motion withEvent:(UIEvent *)event
{
    NSLog(@"motionCancelled");
}

- (BOOL)canBecomeFirstResponder
{
    return YES;
}

@end
