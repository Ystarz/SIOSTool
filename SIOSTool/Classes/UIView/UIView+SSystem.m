//
//  UIView+SSystem.m
//  HDIM
//
//  Created by SSS on 2019/8/19.
//  Copyright © 2019 mj. All rights reserved.
//

#import "UIView+SSystem.h"

@implementation UIView(SSystem)
-(void)saveToPhotoLibrarySuccess:(void(^)(NSString*info))success fail:(void(^)(int code,NSString*info))fail{
    UIImage*img=[self toImage];
    if (img) {
        [[UIImageTool sharedInstance] saveImage:img toPhotoLibrarySuccess:^(NSString * _Nonnull info) {
            success(info);
        } fail:^(int code, NSString * _Nonnull info) {
            fail(code,info);
        }];
    }
}

-(UIImage *)toImage{
    UIView *orgView=self;
    CGSize s = orgView.bounds.size;
    UIGraphicsBeginImageContextWithOptions(s, NO, [UIScreen mainScreen].scale);
    [orgView.layer renderInContext:UIGraphicsGetCurrentContext()];
    UIImage*image = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    return image;
    
}
@end
