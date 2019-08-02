//
//  SDeviceInfo.m
//  HDIM
//
//  Created by SSS on 2019/4/11.
//  Copyright © 2019 mj. All rights reserved.
//

#import "SDeviceInfo.h"
//#import "KeychainItemWrapper.h"

#import "SDeviceID.h"
#import <UIKit/UIKit.h>
//#import "../UIDevice/UIDevice+Resolutions.h"

@implementation SDeviceInfo

+(NSString *)getUQID
{
    return [SDeviceID getUQID];
}

// iOS device
+(NSString *)getPhoneName
{
    return [[UIDevice currentDevice] name];
}
+(NSString *)getSystemName{
    return [[UIDevice currentDevice] systemName];
}
/**
 *  手机系统版本
 *
 *  @return e.g. 8.0
 */
+(NSString *)getPhoneVersion{
    return [[UIDevice currentDevice] systemVersion];
}

+(NSString *)getPhoneModel{
    return [[UIDevice currentDevice] model];
}

+(SDeviceType*) getDeviceType{
    return [SDeviceType sharedInstance];
}

+(NSString*) getDeviceOriginalName{
    return [SDeviceType sharedInstance].deviceOriginalName;
}

+(SDeviceUIInfo*) getUIInfo{
    return [SDeviceUIInfo sharedInstance];
}
@end
