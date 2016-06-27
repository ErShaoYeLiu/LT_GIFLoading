//
//  GIFLoader.h
//  gifDemo
//
//  Created by rimi on 16/6/27.
//  Copyright © 2016年 liutao. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface LTGIFLoader : NSObject
+ (void)loadGIFFromImageName:(NSString *)imageName to:(UIImageView *)imageView;
+ (void)loadGIFFrom:(NSString *)url to:(UIImageView *)imageView;
+ (void)loadGIFData:(NSData *)data to:(UIImageView *)imageView;
@end
