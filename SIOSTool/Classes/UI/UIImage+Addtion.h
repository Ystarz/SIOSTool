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
- (UIImage*)imageCompressWithScale:(float)scale;
- (UIImage *)scaleImageToScale:(float)scaleSize;
@end
