//
//  SSystemInfo.h
//  HDIM
//
//  Created by SSS on 2019/4/11.
//  Copyright © 2019 mj. All rights reserved.
//

#import <Foundation/Foundation.h>

//#define Funcname(objc,func)   @(((objc.func),#func))
//获取app的相关信息
#define APP_BUNDLE_ID [[NSBundle mainBundle]bundleIdentifier]

/** 获取APP名称 */
#define APP_NAME ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleDisplayName"])
/** 程序版本号 */
#define APP_VERSION [[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleShortVersionString"]
/** 获取APP build版本 */
#define APP_BUILD ([[[NSBundle mainBundle] infoDictionary] objectForKey:@"CFBundleVersion"])

NS_ASSUME_NONNULL_BEGIN

@interface SSystemInfo : NSObject
//+(NSString *)getUUID;
+(NSString *)getUQID;
+(NSString *)getPhoneName;
+(NSString *)getSystemName;


+(NSString *)getPhoneVersion API_AVAILABLE(ios(4.0), watchos(2.0), tvos(9.0));
+(NSString *)getPhoneModel API_AVAILABLE( ios(4.0), watchos(2.0), tvos(9.0));
+(NSString *)getDeviceVersion API_AVAILABLE( ios(4.0), watchos(2.0), tvos(9.0));


@end

NS_ASSUME_NONNULL_END
