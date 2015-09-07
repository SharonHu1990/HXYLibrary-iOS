//
//  AppUtils.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "AppUtils.h"

@implementation AppUtils

+(BOOL)isLegalTelephone:(NSString *)phoneNumber
{
    NSString * MOBILE = @"^1(3[0-9]|5[0-35-9]|8[025-9])\\d{8}$";
    NSString * CM = @"^1(34[0-8]|(3[5-9]|5[017-9]|8[278])\\d)\\d{7}$";
    NSString * CU = @"^1(3[0-2]|5[256]|8[56])\\d{8}$";
    NSString * CT = @"^1((33|53|8[09])[0-9]|349)\\d{7}$";
    NSString * PHS = @"^0(10|2[0-5789]|\\d{3})\\d{7,8}$";
    NSPredicate *regextestmobile = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", MOBILE];
    NSPredicate *regextestcm = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CM];
    NSPredicate *regextestcu = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CU];
    NSPredicate *regextestct = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", CT];
    NSPredicate *regextestphs = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", PHS];
    
    return  [regextestmobile evaluateWithObject:phoneNumber]   ||
    [regextestphs evaluateWithObject:phoneNumber]      ||
    [regextestct evaluateWithObject:phoneNumber]       ||
    [regextestcu evaluateWithObject:phoneNumber]       ||
    [regextestcm evaluateWithObject:phoneNumber];
}

+ (BOOL)isLegalPassword:(NSString*)password
{
    NSString *regex = @"(^[a-zA-Z0-9_]{6,14}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:password];
}

+ (BOOL)isLegalUserName:(NSString*)username
{
    NSString *regex = @"(^[a-zA-Z][a-zA-Z0-9_]{5,13}$)";
    NSPredicate *pred = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", regex];
    return [pred evaluateWithObject:username];
}
@end
