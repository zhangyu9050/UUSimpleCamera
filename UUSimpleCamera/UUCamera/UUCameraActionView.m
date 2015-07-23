//
//  UUCameraActionView.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/23.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUCameraActionView.h"
#import "UUCamear-Import.h"
#import "UUCamear-Macros.h"

@interface UUCameraActionView()

@property (nonatomic, strong, getter = getCameraView) UUCameraView *cameraView;

@property (nonatomic, strong, getter = getImageLeft) UIImageView *imageLeft;
@property (nonatomic, strong, getter = getImageRight) UIImageView *imageRight;
@property (nonatomic, strong, getter = getButtonFlash) UIButton *btnFlash;
@property (nonatomic, strong, getter = getButtonFlip) UIButton *btnFlip;

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
    
    [_imageLeft addSubview:self.btnFlash];
    [_imageRight addSubview:self.btnFlip];
    
    [self setNeedsUpdateConstraints];
}

- (void)updateConstraints{
    
    [_imageRight mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(64, ScreenHeight));
        make.top.equalTo(self).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
    }];
    
    [_btnFlash mas_makeConstraints:^(MASConstraintMaker *make) {
       
        make.size.mas_equalTo(CGSizeMake(62, 62));
        make.top.equalTo(self).offset(0);
        make.left.equalTo(self).offset(0);
    }];
    
    [_btnFlip mas_makeConstraints:^(MASConstraintMaker *make) {
        
        make.size.mas_equalTo(CGSizeMake(62, 62));
        make.top.equalTo(self).offset(0);
        make.right.equalTo(self.mas_right).offset(0);
    }];

    [super updateConstraints];
}

- (UIImageView *)getImageLeft{

    if (!_imageLeft) {
        
        _imageLeft = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gfx_bg_capture_left"]];
        _imageLeft.userInteractionEnabled = YES;
    }
    
    return _imageLeft;
}

- (UIImageView *)getImageRight{
    
    if (!_imageRight) {
        
        _imageRight = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"gfx_bg_capture_right"]];
        _imageRight.userInteractionEnabled = YES;
    }
    
    return _imageRight;
}

- (UIButton *)getButtonFlash{

    if (!_btnFlash) {
        
        _btnFlash = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnFlash setImage:[UIImage imageNamed:@"button_flash_off"] forState:UIControlStateNormal];
    }
    
    return _btnFlash;
}

- (UIButton *)getButtonFlip{

    if (!_btnFlip) {
        
        _btnFlip = [UIButton buttonWithType:UIButtonTypeCustom];
        [_btnFlip setImage:[UIImage imageNamed:@"button_flip"] forState:UIControlStateNormal];
    }
    
    return _btnFlip;
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
