//
//  SDeviceType.m
//  SIOSTool
//
//  Created by SSS on 2019/6/19.
//  Copyright © 2019 SSS. All rights reserved.
//

#import "SDeviceType.h"
#import "sys/utsname.h"
#import <UIKit/UIKit.h>

@implementation SDeviceType
// iOS device
+ (instancetype)sharedInstance{
    static SDeviceType *sharedInstance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedInstance = [[self alloc] init];
    });
    return sharedInstance;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
         [self setDeviceName:[SDeviceType getDeviceVersion]];
        [self setDeviceModel:[SDeviceType getDeviceModel]];
        [self setDeviceSeries:[SDeviceType getSDeviceSeries]];
    }
    return self;
}


+(NSString *)getDeviceVersion{
    // 需要#import "sys/utsname.h"
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *tring = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([tring isEqualToString:@"i386"])          return @"Simulator";
    if ([tring isEqualToString:@"x86_64"])        return @"Simulator";
    
    //iPhone
    if ([tring isEqualToString:@"iPhone1,1"])     return @"IPhone_1G";
    if ([tring isEqualToString:@"iPhone1,2"])     return @"IPhone_3G";
    if ([tring isEqualToString:@"iPhone2,1"])     return @"IPhone_3GS";
    if ([tring isEqualToString:@"iPhone3,1"])     return @"IPhone_4";
    if ([tring isEqualToString:@"iPhone3,2"])     return @"IPhone_4";
    if ([tring isEqualToString:@"iPhone4,1"])     return @"IPhone_4s";
    if ([tring isEqualToString:@"iPhone5,1"])     return @"IPhone_5";
    if ([tring isEqualToString:@"iPhone5,2"])     return @"IPhone_5";
    if ([tring isEqualToString:@"iPhone5,3"])     return @"IPhone_5C";
    if ([tring isEqualToString:@"iPhone5,4"])     return @"IPhone_5C";
    if ([tring isEqualToString:@"iPhone6,1"])     return @"IPhone_5S";
    if ([tring isEqualToString:@"iPhone6,2"])     return @"IPhone_5S";
    if ([tring isEqualToString:@"iPhone7,1"])     return @"IPhone_6P";
    if ([tring isEqualToString:@"iPhone7,2"])     return @"IPhone_6";
    if ([tring isEqualToString:@"iPhone8,1"])     return @"IPhone_6s";
    if ([tring isEqualToString:@"iPhone8,2"])     return @"IPhone_6s_P";
    if ([tring isEqualToString:@"iPhone8,4"])     return @"IPhone_SE";
    if ([tring isEqualToString:@"iPhone9,1"])     return @"IPhone_7";
    if ([tring isEqualToString:@"iPhone9,3"])     return @"IPhone_7";
    if ([tring isEqualToString:@"iPhone9,2"])     return @"IPhone_7P";
    if ([tring isEqualToString:@"iPhone9,4"])     return @"IPhone_7P";
    if ([tring isEqualToString:@"iPhone10,1"])    return @"IPhone_8";
    if ([tring isEqualToString:@"iPhone10,4"])    return @"IPhone_8";
    if ([tring isEqualToString:@"iPhone10,2"])    return @"IPhone_8P";
    if ([tring isEqualToString:@"iPhone10,5"])    return @"IPhone_8P";
    if ([tring isEqualToString:@"iPhone10,3"])    return @"IPhone_X";
    if ([tring isEqualToString:@"iPhone10,6"])    return @"IPhone_X";
    
    
    
    //iPod
    if ([tring isEqualToString:@"iPod1,1"])      return @"iPod Touch 1G";
    if ([tring isEqualToString:@"iPod2,1"])      return @"iPod Touch 2G";
    if ([tring isEqualToString:@"iPod3,1"])      return @"iPod Touch 3G";
    if ([tring isEqualToString:@"iPod4,1"])      return @"iPod Touch 4G";
    if ([tring isEqualToString:@"iPod5,1"])      return @"iPod Touch 5G";
    
    //iPad
    if ([tring isEqualToString:@"iPad1,1"])      return @"iPad";
    if ([tring isEqualToString:@"iPad2,1"])      return @"iPad 2 (WiFi)";
    if ([tring isEqualToString:@"iPad2,2"])      return @"iPad 2 (GSM)";
    if ([tring isEqualToString:@"iPad2,3"])      return @"iPad 2 (CDMA)";
    if ([tring isEqualToString:@"iPad2,4"])      return @"iPad 2 (32nm)";
    if ([tring isEqualToString:@"iPad2,5"])      return @"iPad mini (WiFi)";
    if ([tring isEqualToString:@"iPad2,6"])      return @"iPad mini (GSM)";
    if ([tring isEqualToString:@"iPad2,7"])      return @"iPad mini (CDMA)";
    
    if ([tring isEqualToString:@"iPad3,1"])      return @"iPad 3(WiFi)";
    if ([tring isEqualToString:@"iPad3,2"])      return @"iPad 3(CDMA)";
    if ([tring isEqualToString:@"iPad3,3"])      return @"iPad 3(4G)";
    if ([tring isEqualToString:@"iPad3,4"])      return @"iPad 4 (WiFi)";
    if ([tring isEqualToString:@"iPad3,5"])      return @"iPad 4 (4G)";
    if ([tring isEqualToString:@"iPad3,6"])      return @"iPad 4 (CDMA)";
    
    if ([tring isEqualToString:@"iPad4,1"])      return @"iPad Air";
    if ([tring isEqualToString:@"iPad4,2"])      return @"iPad Air";
    if ([tring isEqualToString:@"iPad4,3"])      return @"iPad Air";
    if ([tring isEqualToString:@"iPad5,3"])      return @"iPad Air 2";
    if ([tring isEqualToString:@"iPad5,4"])      return @"iPad Air 2";
    
    
    if ([tring isEqualToString:@"iPad4,4"]
        ||[tring isEqualToString:@"iPad4,5"]
        ||[tring isEqualToString:@"iPad4,6"])      return @"iPad mini 2";
    
    if ([tring isEqualToString:@"iPad4,7"]
        ||[tring isEqualToString:@"iPad4,8"]
        ||[tring isEqualToString:@"iPad4,9"])      return @"iPad mini 3";
    
    return tring;
}

+(SDeviceSeries) getSDeviceSeries
{
    SDeviceSeries deviceType;
    //判断当前设备属于哪个大类
    NSString *deviceTypeString = [UIDevice currentDevice].model;
    if([deviceTypeString isEqualToString:@"iPhone"])
        deviceType = SDeviceiPhone;
    else if([deviceTypeString isEqualToString:@"iPod touch"])
        deviceType = SDeviceiPodTouch;
    else if([deviceTypeString isEqualToString:@"iPad"])
        deviceType = SDeviceiPad;
    else deviceType = SDeviceUnknown;
    return deviceType;
}

+(SDeviceModel) getDeviceModel
{
    SDeviceModel model;
    //根据当前设备实时适配
    struct utsname systemInfo;
    uname(&systemInfo);
    NSString *platform = [NSString stringWithCString:systemInfo.machine encoding:NSUTF8StringEncoding];
    
    if ([platform isEqualToString:@"i386"])
        model = Simulator;
    else if ([platform isEqualToString:@"x86_64"]){
        model = Simulator;
    }
    
    else if ([platform isEqualToString:@"iPhone3,1"])
        model = iPhone4;
    else if ([platform isEqualToString:@"iPhone3,2"])
        model = iPhone4;
    else if ([platform isEqualToString:@"iPhone3,3"])
        model = iPhone4;
    else if ([platform isEqualToString:@"iPhone4,1"])
        model = iPhone4S;
    else if ([platform isEqualToString:@"iPhone5,1"])
        model = iPhone5;
    
    else if ([platform isEqualToString:@"iPhone5,2"])
        model = iPhone5_GSM_CDMA ;
    else if ([platform isEqualToString:@"iPhone5,3"])
        model = iPhone5C_GSM;
    else if ([platform isEqualToString:@"iPhone5,4"])
        model = iPhone5C_GSM_CDMA;
    else if ([platform isEqualToString:@"iPhone6,1"])
        model = iPhone5S_GSM;
    else if ([platform isEqualToString:@"iPhone6,2"])
        model = iPhone5S_GSM_CDMA;
    
    else if ([platform isEqualToString:@"iPhone7,1"])
        model = iPhone6Plus;
    else if ([platform isEqualToString:@"iPhone7,2"])
        model = iPhone6;
    else if ([platform isEqualToString:@"iPhone8,1"])
        model = iPhone6S;
    else if ([platform isEqualToString:@"iPhone8,2"])
        model = iPhone6SPlus;
    else if ([platform isEqualToString:@"iPhone8,4"])
        model = iPhoneSE;
    
    else if ([platform isEqualToString:@"iPhone9,1"])
        model = iPhone7;
    else if ([platform isEqualToString:@"iPhone9,2"])
        model = iPhone7Plus;
    
    // 日行两款手机型号均为日本独占，可能使用索尼FeliCa支付方案而不是苹果支付
    else if ([platform isEqualToString:@"iPhone9,1"])
        model = iPhone7CGR;
    else if ([platform isEqualToString:@"iPhone9,2"])
        model = iPhone7PlusGC;
    else if ([platform isEqualToString:@"iPhone9,3"])
        model = iPhone7TM;
    else if ([platform isEqualToString:@"iPhone9,4"])
        model = iPhone7PlusTM;
    else if ([platform isEqualToString:@"iPhone10,1"])
        model = iPhone8;
    
    else if ([platform isEqualToString:@"iPhone10,4"])
        model = iPhone8;
    else if ([platform isEqualToString:@"iPhone10,2"])
        model = iPhone8Plus;
    else if ([platform isEqualToString:@"iPhone10,5"])
        model = iPhone8Plus;
    else if ([platform isEqualToString:@"iPhone10,3"])
        model = iPhoneX;
    else if ([platform isEqualToString:@"iPhone10,6"])
        model = iPhoneX;
    
    else if ([platform isEqualToString:@"iPod1,1"])
        model = iPodTouch1G;
    else if ([platform isEqualToString:@"iPod2,1"])
        model = iPodTouch2G;
    else if ([platform isEqualToString:@"iPod3,1"])
        model = iPodTouch3G;
    else if ([platform isEqualToString:@"iPod4,1"])
        model = iPodTouch4G;
    else if ([platform isEqualToString:@"iPod5,1"])
        model = iPodTouch5Gen;
    
    else if ([platform isEqualToString:@"iPad1,1"])
        model = iPad;
    else if ([platform isEqualToString:@"iPad1,2"])
        model = iPad3G;
    else if ([platform isEqualToString:@"iPad2,1"])
        model = iPad2WiFi;
    else if ([platform isEqualToString:@"iPad2,2"])
        model = iPad2;
    else if ([platform isEqualToString:@"iPad2,3"])
        model = iPad2_CDMA;
    else if ([platform isEqualToString:@"iPad2,4"])
        model = iPad2;
    
    else if ([platform isEqualToString:@"iPad2,5"])
        model = iPadMiniWiFi;
    else if ([platform isEqualToString:@"iPad2,6"])
        model = iPadMini;
    else if ([platform isEqualToString:@"iPad2,7"])
        model = iPadMini_GSM_CDMA;
    else if ([platform isEqualToString:@"iPad3,1"])
        model = iPad3WiFi;
    
    else if ([platform isEqualToString:@"iPad3,2"])
        model = iPad3_GSM_CDMA;
    else if ([platform isEqualToString:@"iPad3,3"])
        model = iPad3;
    else if ([platform isEqualToString:@"iPad3,4"])
        model = iPad4WiFi;
    else if ([platform isEqualToString:@"iPad3,5"])
        model = iPad4;
    else if ([platform isEqualToString:@"iPad3,6"])
        model = iPad4_GSM_CDMA;
    
    else if ([platform isEqualToString:@"iPad4,1"])
        model = iPadAirWiFi;
    else if ([platform isEqualToString:@"iPad4,2"])
        model = iPadAirCellular;
    else if ([platform isEqualToString:@"iPad4,4"])
        model = iPadMini2WiFi;
    else if ([platform isEqualToString:@"iPad4,5"])
        model = iPadMini2Cellular;
    else if ([platform isEqualToString:@"iPad4,6"])
        model = iPadMini2;
    
    else if ([platform isEqualToString:@"iPad4,7"])
        model = iPadMini3;
    else if ([platform isEqualToString:@"iPad4,8"])
        model = iPadMini3;
    else if ([platform isEqualToString:@"iPad4,9"])
        model = iPadMini3;
    else if ([platform isEqualToString:@"iPad5,1"])
        model = iPadMini4WiFi;
    else if ([platform isEqualToString:@"iPad5,2"])
        model = iPadMini4LTE;
    
    else if ([platform isEqualToString:@"iPad5,3"])
        model = iPadAir2;
    else if ([platform isEqualToString:@"iPad5,4"])
        model = iPadAir2;
    else if ([platform isEqualToString:@"iPad6,3"])
        model = iPadPro9_7;
    else if ([platform isEqualToString:@"iPad6,4"])
        model = iPadPro9_7;
    else if ([platform isEqualToString:@"iPad6,7"])
        model = iPadPro12_9;
    else if ([platform isEqualToString:@"iPad6,8"])
        model = iPadPro12_9;
    else model= UnknownDeviceModel;
    return model;
}
@end
