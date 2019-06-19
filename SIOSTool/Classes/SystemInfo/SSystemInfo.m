//
//  SSystemInfo.m
//  HDIM
//
//  Created by SSS on 2019/4/11.
//  Copyright © 2019 mj. All rights reserved.
//

#import "SSystemInfo.h"
//#import "KeychainItemWrapper.h"
#import "sys/utsname.h"
#import "SDeviceInfo.h"
#import <UIKit/UIKit.h>
//#import "../UIDevice/UIDevice+Resolutions.h"

@implementation SSystemInfo
//+(NSString *)getUUID
//{
//    NSString *key = APP_BUNDLE_ID;
//    KeychainItemWrapper *keychainItem = [[KeychainItemWrapper alloc] initWithIdentifier:key accessGroup:nil];
//
//    NSString *strUUID = [keychainItem objectForKey:(__bridge id)kSecValueData];
//
//    if (strUUID.length <= 0) {
//        strUUID = [[[UIDevice currentDevice] identifierForVendor] UUIDString];
//
//        [keychainItem setObject:@"uuid" forKey:(__bridge id)kSecAttrAccount];
//        [keychainItem setObject:strUUID forKey:(__bridge id)kSecValueData];
//    }
//
//    return strUUID;
//}
//
+(NSString *)getUQID
{
    return [SDeviceInfo getUQID];
}


#if __APPLE__
#if TARGET_IPHONE_SIMULATOR
// iOS Simulator
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
#elif TARGET_OS_IPHONE
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
#elif TARGET_OS_MAC
+(NSString *)getPhoneVersion{
    return @"14";
}
+(NSString *)getSystemName{
    return @"mac os x";
}
// Other kinds of Mac OS
#else
#   //error "Unknown Apple platform"
#endif
#endif



+(NSString *)getDeviceVersion{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *deviceString = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([deviceString isEqualToString:@"i386"])          return @"Simulator";
    if ([deviceString isEqualToString:@"x86_64"])        return @"Simulator";
    
    //iPhone
    if ([deviceString isEqualToString:@"iPhone1,1"])     return @"IPhone_1G";
    if ([deviceString isEqualToString:@"iPhone1,2"])     return @"IPhone_3G";
    if ([deviceString isEqualToString:@"iPhone2,1"])     return @"IPhone_3GS";
    if ([deviceString isEqualToString:@"iPhone3,1"])     return @"IPhone_4";
    if ([deviceString isEqualToString:@"iPhone3,2"])     return @"IPhone_4";
    if ([deviceString isEqualToString:@"iPhone4,1"])     return @"IPhone_4s";
    if ([deviceString isEqualToString:@"iPhone5,1"])     return @"IPhone_5";
    if ([deviceString isEqualToString:@"iPhone5,2"])     return @"IPhone_5";
    if ([deviceString isEqualToString:@"iPhone5,3"])     return @"IPhone_5C";
    if ([deviceString isEqualToString:@"iPhone5,4"])     return @"IPhone_5C";
    if ([deviceString isEqualToString:@"iPhone6,1"])     return @"IPhone_5S";
    if ([deviceString isEqualToString:@"iPhone6,2"])     return @"IPhone_5S";
    if ([deviceString isEqualToString:@"iPhone7,1"])     return @"IPhone_6P";
    if ([deviceString isEqualToString:@"iPhone7,2"])     return @"IPhone_6";
    if ([deviceString isEqualToString:@"iPhone8,1"])     return @"IPhone_6s";
    if ([deviceString isEqualToString:@"iPhone8,2"])     return @"IPhone_6s_P";
    if ([deviceString isEqualToString:@"iPhone8,4"])     return @"IPhone_SE";
    if ([deviceString isEqualToString:@"iPhone9,1"])     return @"IPhone_7";
    if ([deviceString isEqualToString:@"iPhone9,3"])     return @"IPhone_7";
    if ([deviceString isEqualToString:@"iPhone9,2"])     return @"IPhone_7P";
    if ([deviceString isEqualToString:@"iPhone9,4"])     return @"IPhone_7P";
    if ([deviceString isEqualToString:@"iPhone10,1"])    return @"IPhone_8";
    if ([deviceString isEqualToString:@"iPhone10,4"])    return @"IPhone_8";
    if ([deviceString isEqualToString:@"iPhone10,2"])    return @"IPhone_8P";
    if ([deviceString isEqualToString:@"iPhone10,5"])    return @"IPhone_8P";
    if ([deviceString isEqualToString:@"iPhone10,3"])    return @"IPhone_X";
    if ([deviceString isEqualToString:@"iPhone10,6"])    return @"IPhone_X";
    

   
    //iPod
    if ([deviceString isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([deviceString isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([deviceString isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([deviceString isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([deviceString isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad
    if ([deviceString isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([deviceString isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([deviceString isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([deviceString isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([deviceString isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([deviceString isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([deviceString isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([deviceString isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([deviceString isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([deviceString isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([deviceString isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([deviceString isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([deviceString isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([deviceString isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([deviceString isEqualToString:@"iPad5,4"])      return @"iPad Air 2";

    
    if ([deviceString isEqualToString:@"iPad4,4"]
        ||[deviceString isEqualToString:@"iPad4,5"]
        ||[deviceString isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([deviceString isEqualToString:@"iPad4,7"]
        ||[deviceString isEqualToString:@"iPad4,8"]
        ||[deviceString isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return deviceString;
}
@end
