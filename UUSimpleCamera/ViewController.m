//
//  ViewController.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/22.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "ViewController.h"
#import "UUCameraActionView.h"
#import "UUHomeView.h"

@interface ViewController ()

@property (strong, nonatomic) UIButton *snapButton;

@property (nonatomic, strong, getter = getHomeView) UUHomeView *homeView;
@property (nonatomic, strong, getter = getActionView) UUCameraActionView *actionView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    


    [self.view addSubview:self.actionView];
//    [self.view addSubview:self.homeView];
    
    
//    [self.view setBackgroundColor:[UIColor clearColor]];
////    self.view.alpha = .5f;
//    
//    _cameraController = [[UUCameraViewController alloc] init];
//    _cameraController.view.frame = self.view.bounds;
//    
//    [self.view addSubview:_cameraController.view];
//    
//    UIImageView *image = [[UIImageView alloc] initWithFrame:self.view.bounds];
//    image.image = [UIImage imageNamed:@"button_new"];
//    image.alpha =.5f;
////    image.backgroundColor = [UIColor whiteColor];
////    image.frame = self.view.bounds;
//    [self.view addSubview:image];
//    
//    image.layer.borderWidth = 2;
//    image.layer.borderColor = [UIColor redColor].CGColor;
//    
//    _blurView = [[FXBlurView alloc] initWithFrame:self.view.bounds];
//    
//    _blurView.dynamic = NO;
//    _blurView.blurRadius = 5;
//    _blurView.backgroundColor = [UIColor clearColor];
////    _blurView.tintColor = [UIColor colorWithRed:0 green:0.5 blue:0.5 alpha:1];
////    _blurView.contentMode = UIViewContentModeBottom;
//    [self.view addSubview:_blurView];
    
    
//    self.snapButton = [UIButton buttonWithType:UIButtonTypeCustom];
//    self.snapButton.frame = CGRectMake(0, 0, 120.0f, 120.0f);
//    self.snapButton.center = self.view.center;
//    self.snapButton.clipsToBounds = YES;
//    self.snapButton.layer.cornerRadius = 120 / 2.0f;
//    self.snapButton.layer.borderColor = [UIColor whiteColor].CGColor;
//    self.snapButton.layer.borderWidth = 2.0f;
//    self.snapButton.backgroundColor = [[UIColor whiteColor] colorWithAlphaComponent:0.5];
//    self.snapButton.layer.rasterizationScale = [UIScreen mainScreen].scale;
//    self.snapButton.layer.shouldRasterize = YES;
////    [self.snapButton addTarget:self action:@selector(snapButtonPressed:) forControlEvents:UIControlEventTouchUpInside];
//    [self.view addSubview:self.snapButton];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (UUCameraActionView *)getActionView{

    if (!_actionView) {
        
        _actionView = [[UUCameraActionView alloc] initWithFrame:self.view.bounds];
    }
    
    return _actionView;
}

- (UUHomeView *)getHomeView{

    if (!_homeView) {
        
        _homeView = [[UUHomeView alloc] initWithFrame:self.view.bounds];
    }
    
    return _homeView;
}

@end
