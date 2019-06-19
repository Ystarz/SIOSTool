
//
//  SYDDevice.m
//  UQIDDemo
//

//

#import "SDeviceInfo.h"
#import "SYDKeyChain.h"
#import <AdSupport/ASIdentifierManager.h>
#import <UIKit/UIKit.h>

#define UQID_KEY @"com.device.uqid"

@implementation SDeviceInfo

//获取IDFA
+ (NSString *)getIDFA
{
    return [[[ASIdentifierManager sharedManager] advertisingIdentifier] UUIDString];
}

//获取IDFV
+ (NSString *)getIDFV
{
#if __APPLE__
#if TARGET_IPHONE_SIMULATOR
    // iOS Simulator
    return [[UIDevice currentDevice].identifierForVendor UUIDString];
#elif TARGET_OS_IPHONE
    // iOS device
    return [[UIDevice currentDevice].identifierForVendor UUIDString];
#elif TARGET_OS_MAC
    // Other kinds of Mac OS
    return [SYDDevice getUUID];
#else
#   //error "Unknown Apple platform"
    return @"Unknown";
#endif
#endif
    
}

//获取UUID
+ (NSString *)getUUID
{
    return [[NSUUID UUID] UUIDString];
}

//获取UQID
+ (NSString *)getUQID
{
#if __APPLE__
#if TARGET_IPHONE_SIMULATOR
    // iOS Simulator
    //从本地沙盒取
    NSString *uqid = [[NSUserDefaults standardUserDefaults] objectForKey:UQID_KEY];
    
    if (!uqid) {
        //从keychain取
        uqid = (NSString *)[SYDKeyChain readObjectForKey:UQID_KEY];
        
        if (uqid) {
            [[NSUserDefaults standardUserDefaults] setObject:uqid forKey:UQID_KEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        } else {
            //从pasteboard取
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            id data = [pasteboard dataForPasteboardType:UQID_KEY];
            if (data) {
                uqid = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            }
            
            if (uqid) {
                [[NSUserDefaults standardUserDefaults] setObject:uqid forKey:UQID_KEY];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [SYDKeyChain saveObject:uqid forKey:UQID_KEY];
                
            } else {
                
                //获取idfa
                uqid = [self getIDFA];
                
                //idfa获取失败的情况，获取idfv
                if (!uqid || [uqid isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
                    uqid = [self getIDFV];
                    
                    //idfv获取失败的情况，获取uuid
                    if (!uqid) {
                        uqid = [self getUUID];
                    }
                }
                
                [[NSUserDefaults standardUserDefaults] setObject:uqid forKey:UQID_KEY];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [SYDKeyChain saveObject:uqid forKey:UQID_KEY];
                
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                NSData *data = [uqid dataUsingEncoding:NSUTF8StringEncoding];
                [pasteboard setData:data forPasteboardType:UQID_KEY];
                
            }
        }
    }
    return uqid;
#elif TARGET_OS_IPHONE
    // iOS device
    //从本地沙盒取
    NSString *uqid = [[NSUserDefaults standardUserDefaults] objectForKey:UQID_KEY];
    
    if (!uqid) {
        //从keychain取
        uqid = (NSString *)[SYDKeyChain readObjectForKey:UQID_KEY];
        
        if (uqid) {
            [[NSUserDefaults standardUserDefaults] setObject:uqid forKey:UQID_KEY];
            [[NSUserDefaults standardUserDefaults] synchronize];
            
        } else {
            //从pasteboard取
            UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
            id data = [pasteboard dataForPasteboardType:UQID_KEY];
            if (data) {
                uqid = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
            }
            
            if (uqid) {
                [[NSUserDefaults standardUserDefaults] setObject:uqid forKey:UQID_KEY];
                [[NSUserDefaults standardUserDefaults] synchronize];
                [SYDKeyChain saveObject:uqid forKey:UQID_KEY];
                
            } else {
                
                //获取idfa
                uqid = [self getIDFA];
                
                //idfa获取失败的情况，获取idfv
                if (!uqid || [uqid isEqualToString:@"00000000-0000-0000-0000-000000000000"]) {
                    uqid = [self getIDFV];
                    
                    //idfv获取失败的情况，获取uuid
                    if (!uqid) {
                        uqid = [self getUUID];
                    }
                }
                
                [[NSUserDefaults standardUserDefaults] setObject:uqid forKey:UQID_KEY];
                [[NSUserDefaults standardUserDefaults] synchronize];
                
                [SYDKeyChain saveObject:uqid forKey:UQID_KEY];
                
                UIPasteboard *pasteboard = [UIPasteboard generalPasteboard];
                NSData *data = [uqid dataUsingEncoding:NSUTF8StringEncoding];
                [pasteboard setData:data forPasteboardType:UQID_KEY];
                
            }
        }
    }
    return uqid;
#elif TARGET_OS_MAC
    // Other kinds of Mac OS
    return [SYDDevice getUUID];
#else
#   //error "Unknown Apple platform"
    return @"Unknown";
#endif
#endif
    
    
}

@end




