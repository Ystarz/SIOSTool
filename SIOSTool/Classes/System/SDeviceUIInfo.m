//
//  IMSDKSSDeviceDefault.m
//  SSChatView
//
//  Created by soldoros on 2018/9/25.
//  Copyright © 2018年 soldoros. All rights reserved.
//

#import "SDeviceUIInfo.h"
#import "sys/utsname.h"
#import "SDeviceUIDefine.h"
#import "SDeviceInfo.h"

//static SDeviceUIInfo* device = nil;


@implementation SDeviceUIInfo

+ (instancetype)sharedInstance{
    static SDeviceUIInfo *sharedInstance = nil;
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
        SDeviceUIInfo*device=self;//[SDeviceUIInfo sharedInstance];
        SDeviceType* deviceType= [SDeviceInfo getDeviceType];
        device.statuBarHeight= 20;
        device.navBarHeight = 44;
        device.safeAreaTopHeight = 64;
        device.safeAreaBottomHeight = 0;
        device.tabBarHeight = 49;
        
        
        //根据不同的设备适配尺寸 iPhone X的尺寸是375*812
        if(deviceType.deviceSeries==SDeviceiPhone){
            if(deviceType.deviceModel==Simulator){
                if([[UIScreen mainScreen] bounds].size.height==812){
                    device.statuBarHeight = 44;
                    device.navBarHeight = 44;
                    device.safeAreaTopHeight = 88;
                    device.safeAreaBottomHeight = 34;
                    device.tabBarHeight = 49;
                }else{
                    device.statuBarHeight = 20;
                    device.navBarHeight = 44;
                    device.safeAreaTopHeight = 64;
                    device.safeAreaBottomHeight = 0;
                    device.tabBarHeight = 49;
                }
            }
            else{
                if(deviceType.deviceModel == iPhoneX){
                    device.statuBarHeight = 44;
                    device.navBarHeight = 44;
                    device.safeAreaTopHeight = 88;
                    device.safeAreaBottomHeight = 34;
                    device.tabBarHeight = 49;
                }else{
                    device.statuBarHeight = 20;
                    device.navBarHeight = 44;
                    device.safeAreaTopHeight = 64;
                    device.safeAreaBottomHeight = 0;
                    device.tabBarHeight = 49;
                }
            }
        }
        
        //MP4设备目前都采用20+44+49的布局
        else if(deviceType.deviceSeries==SDeviceiPodTouch){
            device.statuBarHeight = 20;
            device.navBarHeight = 44;
            device.safeAreaTopHeight = 64;
            device.safeAreaBottomHeight = 0;
            device.tabBarHeight = 49;
        }
    }
    return self;
}

//+(float)statuBarHeight{
//   return [SDeviceUIInfo statuBarHeight: [SDeviceInfo getDeviceType]];
//}
//+(float)navBarHeight{
//    return [SDeviceUIInfo navBarHeight: [SDeviceInfo getDeviceType]];
//}
//+(float)safeAreaTopHeight{
//     return [SDeviceUIInfo safeAreaTopHeight: [SDeviceInfo getDeviceType]];
//}
//+(float)safeAreaBottomHeight{
//     return [SDeviceUIInfo safeAreaBottomHeight: [SDeviceInfo getDeviceType]];
//}
//+(float)tabBarHeight{
//     return [SDeviceUIInfo tabBarHeight: [SDeviceInfo getDeviceType]];
//}
//
//
//+(float)statuBarHeight:(SDeviceType*)type{
//
//    if(type.deviceSeries==DeviceiPhone){
//
//        if(type.deviceModel==Simulator){
//            SDeviceModel model=type.deviceModel;
//    switch (model) {
//        case Simulator:
//            if([[UIScreen mainScreen] bounds].size.height==812){
//                device.statuBarHeight = 44;
//            }
//            break;
//
//        default:
//            statuBarHeight
//            break;
//    }
//
//        }
//
//    }
//    return statuBarHeight;
//}
//+(float)navBarHeight:(SDeviceModel)model{}
//+(float)safeAreaTopHeight:(SDeviceModel)model{}
//+(float)safeAreaBottomHeight:(SDeviceModel)model{}
//+(float)tabBarHeight:(SDeviceModel)model{}
@end
