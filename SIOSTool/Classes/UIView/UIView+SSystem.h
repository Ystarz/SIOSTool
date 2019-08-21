//
//  UIView+SSystem.h
//  HDIM
//
//  Created by SSS on 2019/8/19.
//  Copyright © 2019 mj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "UIImageTool.h"
NS_ASSUME_NONNULL_BEGIN

@interface UIView(SSystem)
//@property(nonatomic,strong)SuccessBlock successBlock;
//@property(nonatomic,strong)FailBlock failBlock;
-(void)saveToPhotoLibrarySuccess:(void(^)(NSString*info))success fail:(void(^)(int code,NSString*info))fail;
-(UIImage *)toImage;
@end

NS_ASSUME_NONNULL_END
