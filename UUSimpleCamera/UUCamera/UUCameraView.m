//
//  UUCameraView.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/23.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUCameraView.h"

@interface UUCameraView(){

    UIVisualEffectView *blurEffectView;
}

@property (nonatomic, retain) AVCaptureSession *session;
@property (nonatomic, retain) AVCaptureDeviceInput *input;
@property (nonatomic, retain) AVCaptureDevice *device;
@property (nonatomic, retain) AVCaptureStillImageOutput *imageOutput;
@property (nonatomic, retain) AVCaptureVideoPreviewLayer *preview;

@end

@implementation UUCameraView

-(instancetype)initWithFrame:(CGRect)frame positionDevice:(UUDevicePositon)position blur:(UIBlurEffectStyle)blur {
    if (self = [super initWithFrame:frame]) {
        [self initCameraInPosition:position];
        [self addBlurEffect:blur];
    }
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame positionDevice:(UUDevicePositon)position {
    if (self = [super initWithFrame:frame]) {
        [self initCameraInPosition:position];
    }
    return self;
}
-(void)initCameraInPosition:(UUDevicePositon)position {
    self.session = [AVCaptureSession new];
    [self.session setSessionPreset:AVCaptureSessionPresetHigh];
    
    NSArray *devices = [NSArray new];
    devices = [AVCaptureDevice devicesWithMediaType:AVMediaTypeVideo];
    for (AVCaptureDevice *device in devices) {
        if (position == kUUDevicePositonBack) {
            if ([device position] == AVCaptureDevicePositionBack) {
                _device = device;
                break;
            }
        }else {
            if ([device position] == AVCaptureDevicePositionFront) {
                _device = device;
                break;
            }
        }
    }
    
    NSError *error;
    
    self.input = [[AVCaptureDeviceInput alloc] initWithDevice:self.device error:&error];
    if ([self.session canAddInput:self.input]) {
        [self.session addInput:self.input];
    }
    
    self.imageOutput = [AVCaptureStillImageOutput new];
    NSDictionary *outputSettings = @{AVVideoCodecKey:AVVideoCodecJPEG};
    [self.imageOutput setOutputSettings:outputSettings];
    [self.session addOutput:self.imageOutput];
    self.preview = [[AVCaptureVideoPreviewLayer alloc] initWithSession:self.session];
    [self.preview setVideoGravity:AVLayerVideoGravityResizeAspectFill];
    [self.preview setFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height)];
    [self.layer addSublayer:self.preview];
    [self.session startRunning];
    
}
-(void)removeBlurEffect {
    [blurEffectView removeFromSuperview];
}
-(void)addBlurEffect:(UIBlurEffectStyle)style {
    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:style];
    
    blurEffectView = [[UIVisualEffectView alloc] initWithEffect:blur];
    blurEffectView.frame = self.bounds;
    
    [self insertSubview:blurEffectView atIndex:1];
}

-(void)capturePhotoNowWithcompletionBlock:(void (^)(UIImage *))completionBlock{
    
    if (self.imageOutput != nil) {
        AVCaptureConnection *videoConnection = nil;
        for (AVCaptureConnection *connection in self.imageOutput.connections) {
            for (AVCaptureInputPort * port in connection.inputPorts) {
                if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                    videoConnection = connection;
                    break;
                }
            }
            if (videoConnection) { break; }
        }
        
        [self.imageOutput captureStillImageAsynchronouslyFromConnection:videoConnection
                                                      completionHandler:^(CMSampleBufferRef imageDataSampleBuffer, NSError *error) {
                                                          NSData *ImageData = [AVCaptureStillImageOutput jpegStillImageNSDataRepresentation:imageDataSampleBuffer];
                                                          UIImage *image = [UIImage imageWithData:ImageData];
                                                          UIImage *imageToDisplay = [UIImage imageWithCGImage:[image CGImage]
                                                                                                        scale:1.0
                                                                                                  orientation:UIImageOrientationLeftMirrored];
                                                          completionBlock(imageToDisplay);
                                                          
                                                      }];
    }
}

@end
