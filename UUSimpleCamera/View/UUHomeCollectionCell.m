//
//  UUHomeCollectionCell.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/23.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUHomeCollectionCell.h"

//十进制颜色
#define COLOR_WITH_RGB(r,g,b,a) [UIColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:a]

@interface UUHomeCollectionCell()

@property (nonatomic, strong, getter = getImageView) UIImageView *imageView;
@property (nonatomic, strong, getter = getCircleLayer) CALayer *circleLayer;

@end

@implementation UUHomeCollectionCell

- (instancetype)init{
    
    if (self = [super init]) {
        
        [self configUI];
    }
    
    return self;
}

- (id)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
    }
    
    return self;
}

- (void)configUI{

//    self.layer.borderWidth = 2;
//    self.layer.borderColor = [UIColor greenColor].CGColor;
    
    [self addSubview:self.imageView];
    [self.layer addSublayer:self.circleLayer];
}

- (void)setContentWithObject:(id)obj{

    _imageView.image = [UIImage imageNamed:@"button_new_camera_stroke"];
}

- (UIImageView *)getImageView{

    if (!_imageView) {
        
        CGFloat width = CGRectGetWidth(self.contentView.frame);
        width -= 30;
        
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(15, 15, width, width)];
        _imageView.clipsToBounds = YES;
        _imageView.layer.cornerRadius = width / 2.0f;

        _imageView.backgroundColor = [COLOR_WITH_RGB(210,80,80,1) colorWithAlphaComponent:0.9];
        _imageView.layer.rasterizationScale = [UIScreen mainScreen].scale;
        _imageView.layer.shouldRasterize = YES;
    }
    
    return _imageView;
}

- (CALayer *)getCircleLayer{

    if (!_circleLayer) {
        
        _circleLayer = [[CALayer alloc] init];
        _circleLayer.frame = self.contentView.frame;
        
        _circleLayer.cornerRadius = CGRectGetWidth(self.contentView.frame) / 2.0f;
        _circleLayer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:.5f].CGColor;
        _circleLayer.borderWidth = 3.0f;

    }
    
    return _circleLayer;
}

@end
