//
//  UIColor(SSExtension).m
//  HDIM
//
//  Created by SSS on 2019/10/19.
//  Copyright © 2019 hd. All rights reserved.
//

#import "UIColor+SSExtension.h"


@implementation UIColor(SSExtension)
-(NSArray*)getRGBA{
    CGFloat R, G, B,A;
    CGColorRef color = [self CGColor];
    int numComponents = (int)CGColorGetNumberOfComponents(color);
    if (numComponents == 4)
    {
        const CGFloat *components = CGColorGetComponents(color);
        R = components[0];
        G = components[1];
        B = components[2];
        A=components[3];
        return @[@(R),@(G),@(B),@(A)];
    }
    else if(numComponents == 2){
        const CGFloat *components = CGColorGetComponents(color);
        R = components[0];
        G = components[0];
        B = components[0];
        A = components[1];
        return @[@(R),@(G),@(B),@(A)];
    }
    
    
    return [NSArray new];
}

- (void)getRGBComponents:(CGFloat [3])components forColor:(UIColor *)color {
    CGColorSpaceRef rgbColorSpace = CGColorSpaceCreateDeviceRGB();
    unsigned char resultingPixel[4];
    CGContextRef context = CGBitmapContextCreate(&resultingPixel,
                                                 1,
                                                 1,
                                                 8,
                                                 4,
                                                 rgbColorSpace,
                                                 kCGImageAlphaNoneSkipLast);
    CGContextSetFillColorWithColor(context, [color CGColor]);
    CGContextFillRect(context, CGRectMake(0, 0, 1, 1));
    CGContextRelease(context);
    CGColorSpaceRelease(rgbColorSpace);
    for (int component = 0; component < 3; component++) {
        components[component] = resultingPixel[component] / 255.0f;
    }
}

@end
