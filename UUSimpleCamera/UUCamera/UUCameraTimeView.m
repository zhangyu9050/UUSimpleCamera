//
//  UUCameraTimeView.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/23.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "UUCameraTimeView.h"
#import "UUCamear-Import.h"

@interface UUCameraTimeView()

@property (nonatomic, strong, getter = getCircleLayer) CALayer *circleLayer;
@property (nonatomic, strong, getter = getLabelSecond) UILabel *lblSecond;

@end

@implementation UUCameraTimeView

- (instancetype)initWithFrame:(CGRect)frame{
    
    if (self = [super initWithFrame:frame]) {
        
        [self configUI];
    }
    
    return self;
}

- (void)configUI{
    
    self.backgroundColor = [UIColor clearColor];
    [self.layer addSublayer:self.circleLayer];

    [self addSubview:self.lblSecond];
}


- (UILabel *)getLabelSecond{

    if (!_lblSecond) {
        
        CGFloat offsetY = CGRectGetHeight(self.frame) /2 -15;
        _lblSecond = [[UILabel alloc] initWithFrame:CGRectMake(25, offsetY, 100, 30)];
        _lblSecond.textAlignment = NSTextAlignmentLeft;
        _lblSecond.font = [UIFont systemFontOfSize:22];
        _lblSecond.textColor = [UIColor whiteColor];
        _lblSecond.text = @"0 s";
        
    }
    
    return _lblSecond;
}

- (CALayer *)getCircleLayer{
    
    if (!_circleLayer) {
        
        _circleLayer = [[CALayer alloc] init];
        _circleLayer.frame = CGRectMake(8, 8, CGRectGetWidth(self.frame) -16, CGRectGetWidth(self.frame) -16);
        
        _circleLayer.cornerRadius = (CGRectGetWidth(self.frame) -16) / 2.0f;
        _circleLayer.borderColor = [[UIColor whiteColor] colorWithAlphaComponent:.3f].CGColor;
        _circleLayer.borderWidth = 5.0f;
        
    }
    
    return _circleLayer;
}

@end
