//
//  SDeviceType.h
//  SIOSTool
//
//  Created by SSS on 2019/6/19.
//  Copyright © 2019 SSS. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "SDeviceTypeDefine.h"

NS_ASSUME_NONNULL_BEGIN

@interface SDeviceType : NSObject

@property(strong,nonatomic)NSString*deviceName;
@property(assign,nonatomic)SDeviceSeries deviceSeries;
@property(assign,nonatomic)SDeviceModel deviceModel;

+(instancetype)sharedInstance;
//-(instancetype)type;
@end

NS_ASSUME_NONNULL_END
