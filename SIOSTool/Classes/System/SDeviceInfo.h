//
//  SDeviceInfo.h
//  HDIM
//
//  Created by SSS on 2019/4/11.
//  Copyright © 2019 mj. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDeviceTypeDefine.h"
#import "SDeviceType.h"
#import "SDeviceUIInfo.h"

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



@interface SDeviceInfo : NSObject

+(NSString *)getUQID;
+(NSString *)getPhoneName;
+(NSString *)getSystemName;


+(NSString *)getPhoneVersion API_AVAILABLE(ios(4.0), watchos(2.0), tvos(9.0));
+(NSString *)getPhoneModel API_AVAILABLE( ios(4.0), watchos(2.0), tvos(9.0));

///**
// 获取设备名称
//
// @return <#return value description#>
// */
//+(NSString *)getDeviceVersion API_AVAILABLE( ios(4.0), watchos(2.0), tvos(9.0));

/**
 获取设备类型信息

 @return <#return value description#>
 */
+(SDeviceType*) getDeviceType;
+(NSString*) getDeviceOriginalName;

+(SDeviceUIInfo*) getUIInfo;
///**
// 获取设备枚举名
//
// @return <#return value description#>
// */
//+(SDeviceModel) getDeviceModel;

@end

NS_ASSUME_NONNULL_END
