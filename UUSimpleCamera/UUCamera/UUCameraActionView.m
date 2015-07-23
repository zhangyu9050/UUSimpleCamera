//
//  UUCameraActionView.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/23.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUCameraActionView.h"
#import "UUCameraView.h"

@interface UUCameraActionView()

@property (nonatomic, strong, getter = getCameraView) UUCameraView *cameraView;
@property (nonatomic, strong, getter = getImageLeft) UIImageView *imageLeft;
@property (nonatomic, strong, getter = getImageRight) UIImageView *imageRight;

@end

@implementation UUCameraActionView

- (instancetype)initWithFrame:(CGRect)frame{

    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
    }
    
    return self;
}

- (void)configUI{

    [self addSubview:self.cameraView];
    [self addSubview:self.imageLeft];
    [self addSubview:self.imageRight];
}

- (UIImageView *)getImageLeft{

    if (!_imageLeft) {
        
        _imageLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gfx_bg_capture_left"]];
    }
    
    return _imageLeft;
}

- (UIImageView *)getImageRight{
    
    if (!_imageRight) {
        
        _imageRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gfx_bg_capture_right"]];
    }
    
    return _imageRight;
}

- (UUCameraView *)getCameraView{
    
    if (!_cameraView) {
        
        _cameraView = [[UUCameraView alloc] initWithFrame:self.bounds
                                           positionDevice:kUUDevicePositonBack
                                                     blur:UIBlurEffectStyleLight];
    }
    
    return _cameraView;
}


@end
