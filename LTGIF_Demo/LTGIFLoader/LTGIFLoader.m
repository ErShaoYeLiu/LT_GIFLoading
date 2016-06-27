//
//  GIFLoader.m
//  gifDemo
//
//  Created by rimi on 16/6/27.
//  Copyright © 2016年 liutao. All rights reserved.
//

#import "LTGIFLoader.h"
#import <ImageIO/ImageIO.h>
@implementation LTGIFLoader
/**< 本地添加gif动图 */
+ (void)loadGIFFromImageName:(NSString *)imageName to:(UIImageView *)imageView{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:imageName ofType:nil];
    NSData *imageData = [NSData dataWithContentsOfFile:filePath];
    [self loadGIFData:imageData to:imageView];

}
/**< url添加gif动图 */
+ (void)loadGIFFrom:(NSString *)url to:(UIImageView *)imageView {
    NSData *gifData = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
    [self loadGIFData:gifData to:imageView];
}
/**< 源 */
+ (void)loadGIFData:(NSData *)data to:(UIImageView *)imageView {
    NSMutableArray *frames = nil;
    CGImageSourceRef src = CGImageSourceCreateWithData((CFDataRef)data, NULL);
    CGFloat animationTime = 0.f;
    if (src) {
        size_t l = CGImageSourceGetCount(src);
        frames = [NSMutableArray arrayWithCapacity:l];
        for (size_t i = 0; i < l; i++) {
            CGImageRef img = CGImageSourceCreateImageAtIndex(src, i, NULL);
            NSDictionary *properties = (NSDictionary *)CFBridgingRelease(CGImageSourceCopyPropertiesAtIndex(src, i, NULL));
            NSDictionary *frameProperties = [properties objectForKey:(NSString *)kCGImagePropertyGIFDictionary];
            NSNumber *delayTime = [frameProperties objectForKey:(NSString *)kCGImagePropertyGIFUnclampedDelayTime];
            animationTime += [delayTime floatValue];
            if (img) {
                [frames addObject:[UIImage imageWithCGImage:img]];
                CGImageRelease(img);
            }
        }
        CFRelease(src);
    }
    [imageView setImage:[frames objectAtIndex:0]];
    [imageView setAnimationImages:frames];
    [imageView setAnimationDuration:animationTime];
    [imageView startAnimating];
}

@end
