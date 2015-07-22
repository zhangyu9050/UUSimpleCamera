//
//  ViewController.m
//  UUSimpleCamera
//
//  Created by zhangyu on 15/7/22.
//  Copyright (c) 2015年 zhangyu. All rights reserved.
//

#import "ViewController.h"
#import "UUCameraViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UUCameraViewController *cameraController;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    _cameraController = [[UUCameraViewController alloc] init];
    _cameraController.view.frame = self.view.bounds;
    
    [self.view addSubview:_cameraController.view];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
