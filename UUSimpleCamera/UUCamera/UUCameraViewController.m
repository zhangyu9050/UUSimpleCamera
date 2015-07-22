//
//  UUCameraViewController.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/22.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUCameraViewController.h"

@interface UUCameraViewController() < AVCaptureFileOutputRecordingDelegate >

@property (nonatomic, strong) AVCaptureSession *session;
@property (strong, nonatomic) AVCaptureStillImageOutput *stillImageOutput;
@property (nonatomic, strong) AVCaptureVideoPreviewLayer *captureVideoPreviewLayer;

@end

@implementation UUCameraViewController

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self initialize];
        
        self.view.backgroundColor = [UIColor clearColor];
        self.view.autoresizingMask = UIViewAutoresizingNone;
        
    }
    
    return self;
}

- (void)initialize{
    
    _session = [[AVCaptureSession alloc] init];
    _session.sessionPreset = AVCaptureSessionPresetHigh;

    CGRect frame = self.view.bounds;
    _captureVideoPreviewLayer = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    _captureVideoPreviewLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
    _captureVideoPreviewLayer.bounds = self.view.bounds;
    _captureVideoPreviewLayer.position = CGPointMake(CGRectGetMidX(frame), CGRectGetMidY(frame));
    
    [self.view.layer addSublayer:_captureVideoPreviewLayer];
    
    AVCaptureDevicePosition devicePosition;
    devicePosition = AVCaptureDevicePositionBack;

    
    AVCaptureDevice *audioCaptureDevice = [self cameraWithPosition:devicePosition];
    AVCaptureDeviceInput *audioDeviceInput = [AVCaptureDeviceInput deviceInputWithDevice:audioCaptureDevice error:nil];
    
    [_session addInput:audioDeviceInput];
    
    AVCaptureMovieFileOutput *movieFileOutput = [[AVCaptureMovieFileOutput alloc] init];
    [_session addOutput:movieFileOutput];
    
    _stillImageOutput = [[AVCaptureStillImageOutput alloc] init];
    NSDictionary *outputSettings = [[NSDictionary alloc] initWithObjectsAndKeys: AVVideoCodecJPEG, AVVideoCodecKey, nil];
    [_stillImageOutput setOutputSettings:outputSettings];
    [_session addOutput:_stillImageOutput];
    
    
    [_session startRunning];
}

- (AVCaptureDevice *) cameraWithPosition:(AVCaptureDevicePosition) position
{
    NSArray *devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if (device.position == position) return device;
    }
    return nil;
}


@end
