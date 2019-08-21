//
//  UIImage+SSystem.h
//  HDIM
//
//  Created by SSS on 2019/8/19.
//  Copyright © 2019 mj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^SuccessBlock)(NSString* info);
typedef void (^FailBlock)(int code,NSString* info);

@interface UIImageTool:NSObject

+(instancetype)sharedInstance;
@property(nonatomic,strong)SuccessBlock successBlock;
@property(nonatomic,strong)FailBlock failBlock;
//-(void)saveToPhotoLibrarySuccess:(void(^)(NSString*info))success fail:(void(^)(int code,NSString*info))fail;
-(void)saveImage:(UIImage*)img toPhotoLibrarySuccess:(void(^)(NSString*info))success fail:(void(^)(int code,NSString*info))fail;
@end

NS_ASSUME_NONNULL_END
