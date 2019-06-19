

#import <Foundation/Foundation.h>


@interface SDeviceID : NSObject

//获取IDFA
+ (NSString *)getIDFA;
//获取IDFV
+ (NSString *)getIDFV;
//获取UUID
+ (NSString *)getUUID;
//获取UQID
+ (NSString *)getUQID;

@end
