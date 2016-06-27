//
//  ViewController.m
//  LTGIF_Demo
//
//  Created by rimi on 16/6/27.
//  Copyright © 2016年 liutao. All rights reserved.
//

#import "ViewController.h"
#import "LTGIFLoader.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithWhite:0.6 alpha:0.5];
    /**< 设置imageview */
    UIImageView * imageview = [[UIImageView alloc] init];
    imageview.bounds = CGRectMake(0, 0, 400, 200);
    imageview.center = self.view.center;
    
    [LTGIFLoader loadGIFFromImageName:@"等待.gif" to:imageview];
    
    [self.view addSubview:imageview];}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
