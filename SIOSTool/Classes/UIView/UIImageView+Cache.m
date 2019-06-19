//
//  UIImageView+Cache.m
//  HDIM
//
//  Created by mac on 2019/1/14.
//  Copyright © 2019年 mj. All rights reserved.
//

#import "UIImageView+Cache.h"

@implementation UIImageView(Cache)

- (void)setImageWithURL:(nullable NSURL *)url
       placeholderImage:(nullable UIImage *)placeholder
                options:(ImageOptions)options{
    [self setImage:placeholder];
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0),^{
        NSError*error=[NSError new];
        NSData *responseData = [NSData dataWithContentsOfURL:url options:NSDataReadingMappedIfSafe error:&error];
       UIImage *image = [UIImage imageWithData:responseData];
        dispatch_async(dispatch_get_main_queue(), ^{
            //更新UI
            [self setImage:image];
        });
    });
}


@end
