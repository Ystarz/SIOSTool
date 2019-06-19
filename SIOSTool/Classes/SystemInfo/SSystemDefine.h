//
//  SystemDefine.h
//  HDIM
//
//  Created by mac on 2019/2/22.
//  Copyright © 2019年 mj. All rights reserved.
//

#ifndef SystemDefine_h
#define SystemDefine_h

#if __APPLE__
#if TARGET_IPHONE_SIMULATOR
// iOS Simulator
#import "SSystemInfo.h"
//系统版本
#define SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS10_OR_LATER (SYS_VERSION >= 10.0)
#define IOS9_OR_LATER (SYS_VERSION >= 9.0)
#define IOS8_OR_LATER (SYS_VERSION >= 8.0)
#define IOS7_OR_LATER (SYS_VERSION >= 7.0)
#define IOS6_OR_LATER (SYS_VERSION >= 6.0)



#elif TARGET_OS_IPHONE
// iOS device
#import "SSystemInfo.h"
//系统版本
#define SYS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define IOS10_OR_LATER (SYS_VERSION >= 10.0)
#define IOS9_OR_LATER (SYS_VERSION >= 9.0)
#define IOS8_OR_LATER (SYS_VERSION >= 8.0)
#define IOS7_OR_LATER (SYS_VERSION >= 7.0)
#define IOS6_OR_LATER (SYS_VERSION >= 6.0)

#elif TARGET_OS_MAC
// Other kinds of Mac OS
#else
#   //error "Unknown Apple platform"
#endif
#endif



#define QUEUE_HIGH dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0)
#define QUEUE_DEFAULT dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0)
#define QUEUE_LOW dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_LOW, 0)
#define QUEUE_BACKGROUND dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_BACKGROUND, 0)

#define QUEUE_MAIN(block) dispatch_async(dispatch_get_main_queue(), ^{block})
#define QUEUE_ASYNC_DEFAULT(block) dispatch_async(QUEUE_DEFAULT, ^{block})
#define QUEUE_ASYNC_LOW(block) dispatch_async(QUEUE_LOW, ^{block})
#define QUEUE_ASYNC_HIGH(block) dispatch_async(QUEUE_HIGH, ^{block})
#define QUEUE_ASYNC_BACKGROUND(block) dispatch_async(QUEUE_BACKGROUND, ^{block})


#define NSStringFormat(fmt, ...)            \
[NSString stringWithFormat:(fmt), ##__VA_ARGS__]
#endif /* SystemDefine_h */
