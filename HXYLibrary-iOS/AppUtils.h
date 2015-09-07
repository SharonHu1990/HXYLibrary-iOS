//
//  AppUtils.h
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface AppUtils : NSObject



/********************* Verification Utils **********************/

//验证手机号码合法性
+ (BOOL)isLegalTelephone:(NSString*)phoneNumber;

//验证密码的合法性
+ (BOOL)isLegalPassword:(NSString*)password;

//验证昵称的合法性
+ (BOOL)isLegalUserName:(NSString*)username;
@end
