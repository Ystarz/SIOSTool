//
//  IMSDKSSDeviceDefault.h
//  SSChatView
//
//  Created by soldoros on 2018/9/25.
//  Copyright © 2018年 soldoros. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>


//当前窗口的高度 宽度
#define SCREEN_Height [[UIScreen mainScreen] bounds].size.height
#define SCREEN_Width  [[UIScreen mainScreen] bounds].size.width



@interface SDeviceUIInfo : NSObject
+(instancetype)sharedInstance;

//状态栏 导航栏 安全区域顶部  安全区域(iPhone X有) 标签栏
@property(assign,nonatomic)float statuBarHeight;
@property(assign,nonatomic)float navBarHeight;
@property(assign,nonatomic)float safeAreaTopHeight;
@property(assign,nonatomic)float safeAreaBottomHeight;
@property(assign,nonatomic)float tabBarHeight;








@end
