//
//  SDeviceUIDefine.h
//  SIOSTool
//
//  Created by SSS on 2019/6/19.
//  Copyright © 2019 SSS. All rights reserved.
//

#ifndef SDeviceUIDefine_h
#define SDeviceUIDefine_h

//安全区域顶部
#define SafeAreaTop_Height [SDeviceUIInfo sharedInstance].safeAreaTopHeight //[IMSDKSSDeviceDefault shareCKDeviceDefault].safeAreaTopHeight
//安全区域底部（iPhone X有）
#define SafeAreaBottom_Height [SDeviceUIInfo sharedInstance].safeAreaBottomHeight
//[IMSDKSSDeviceDefault shareCKDeviceDefault].safeAreaBottomHeight

//状态栏
#define StatuBar_Height [SDeviceUIInfo sharedInstance].statuBarHeight
//[IMSDKSSDeviceDefault shareCKDeviceDefault].statuBarHeight


#endif /* SDeviceUIDefine_h */
