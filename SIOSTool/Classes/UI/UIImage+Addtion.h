//
//  UIImage+Addtion.h
//  HDIM
//
//  Created by mac on 2019/1/20.
//  Copyright © 2019年 mj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface UIImage(Addtion)
//颜色转换成图片
+ (UIImage *)imageFromColor:(UIColor *)color;

//改变图片的颜色
-(UIImage *)imageWithColor:(UIColor *)color;

//获取本地视频的第一帧 返回图片
+(UIImage *)getImage:(NSString *)videoURL;

- (UIImage*)imageCompressWithScale:(float)scale;
- (UIImage *)scaleImageToScale:(float)scaleSize;
@end
