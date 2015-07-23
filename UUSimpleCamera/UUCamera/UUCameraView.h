//
//  UUCameraView.h
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/23.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>

typedef enum{
    
    kUUDevicePositonFront = 0,
    kUUDevicePositonBack
    
}UUDevicePositon;

@interface UUCameraView : UIView

-(instancetype)initWithFrame:(CGRect)frame positionDevice:(UUDevicePositon)position blur:(UIBlurEffectStyle)blur;

-(instancetype)initWithFrame:(CGRect)frame positionDevice:(UUDevicePositon)position;

-(void)capturePhotoNowWithcompletionBlock:(void(^)(UIImage *image))completionBlock;

-(void)addBlurEffect:(UIBlurEffectStyle)style;

-(void)removeBlurEffect;


@end
