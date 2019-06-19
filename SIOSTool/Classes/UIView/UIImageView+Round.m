//
//  UIImageView+Round.m
//  HDIM
//
//  Created by mac on 2019/1/19.
//  Copyright © 2019年 mj. All rights reserved.
//

#import "UIImageView+Round.h"

@implementation UIImageView(Round)
-(UIImageView*)getRoundImage{
    //开始对imageView进行画图
    UIGraphicsBeginImageContextWithOptions(self.bounds.size, NO, 1.0);
    //使用贝塞尔曲线画出一个圆形图
    [[UIBezierPath bezierPathWithRoundedRect:self.bounds cornerRadius:self.frame.size.width] addClip];
    [self drawRect:self.bounds];
    self.image = UIGraphicsGetImageFromCurrentImageContext();
    //结束画图
    UIGraphicsEndImageContext();
    [self layoutIfNeeded];
    return self;
}
@end
