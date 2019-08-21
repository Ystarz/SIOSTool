//
//  UIImage+SSystem.m
//  HDIM
//
//  Created by SSS on 2019/8/19.
//  Copyright © 2019 mj. All rights reserved.
//

#import "UIImageTool.h"

@implementation UIImageTool
#pragma mark 单例
+ (instancetype)sharedInstance{
    static UIImageTool *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

-(void)saveImage:(UIImage*)img toPhotoLibrarySuccess:(void(^)(NSString*info))success fail:(void(^)(int code,NSString*info))fail{
    //UIImage*img=self;
    UIImageWriteToSavedPhotosAlbum(img, self, @selector(image:didFinishSavingWithError:contextInfo:), nil);
    self.successBlock=success;
    self.failBlock = fail;
}

#pragma mark -- <保存到相册>
-(void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo {
    NSString *msg = nil ;
    if(error){
        msg = @"保存图片失败" ;
        if (self.failBlock) {
            self.failBlock(404, @"fail to save image");
        }
    }else{
        msg = @"保存图片成功" ;
        if (self.successBlock) {
            self.successBlock(@"success to save image");
        }
    }
    NSLog(@"%@",msg);
}
@end
