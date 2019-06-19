//
//  UIDevice+TFDevice.h
//  playcity-mobile
//
//  Created by mac on 2019/1/14.
//
#import <UIKit/UIKit.h>
@interface UIDevice(Orientation)
/**
 * @interfaceOrientation 输入要强制转屏的方向
 */
+ (void)switchNewOrientation:(UIInterfaceOrientation)interfaceOrientation;
@end
