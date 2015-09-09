//
//  AppUtils.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "AppUtils.h"

@interface AppUtils ()<MBProgressHUDDelegate>

@end

@implementation AppUtils

+(void)showSystemAlertWithTitle:(NSString *)title message:(NSString *)msg cancelButtonTitle:(NSString *)cancelButtonTitle confirmCancelButtonTitle:(NSString *)confirmButtonTitle confirmAction:(AlertConfirmActionBlock)confirmActionBlock
{
    UIAlertView *systemAlert = [[UIAlertView alloc] initWithTitle:title message:msg delegate:nil cancelButtonTitle:cancelButtonTitle otherButtonTitles:confirmButtonTitle, nil];
    [systemAlert show];
}

+(void)showCompletedHUDOnView:(UIView *)view withLableText:(NSString *)labelText completedBlock:(HUDCompletedBlock)completedBlock showImage:(BOOL)showImage
{
    MBProgressHUD *hud = [MBProgressHUD HUDForView:view];
    
    if (!hud) {
        hud = [[MBProgressHUD alloc] initWithView:view];
        [view addSubview:hud];
        [hud show:YES];
    }
    
    if (showImage) {
        UIImage *image = [UIImage imageNamed:@"37x-Checkmark.png"];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
        hud.customView = imageView;
        hud.mode = MBProgressHUDModeCustomView;
    }
    else{
         hud.mode = MBProgressHUDModeText;
    }
    hud.labelText = labelText;
    
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.7 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        [self dismissHUD:hud];
        if (completedBlock) {
            completedBlock();
        }
    });
}

+(void)dismissHUD:(MBProgressHUD *)hud
{
    [hud removeFromSuperview];
    hud = nil;
}

+(void)showLoadingHUDOnView:(UIView *)view withLabelText:(NSString *)labelText
{
    
    MBProgressHUD *hud = [[MBProgressHUD alloc] initWithView:view];
    [view addSubview:hud];
    hud.labelText = labelText;
    [hud show:YES];
}

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

+(BOOL)isLegalEmail:(NSString *)email
{
    NSString *emailRegEx =
    @"(?:[a-z0-9!#$%\\&'*+/=?\\^_`{|}~-]+(?:\\.[a-z0-9!#$%\\&'*+/=?\\^_`{|}"
    @"~-]+)*|\"(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21\\x23-\\x5b\\x5d-\\"
    @"x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])*\")@(?:(?:[a-z0-9](?:[a-"
    @"z0-9-]*[a-z0-9])?\\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?|\\[(?:(?:25[0-5"
    @"]|2[0-4][0-9]|[01]?[0-9][0-9]?)\\.){3}(?:25[0-5]|2[0-4][0-9]|[01]?[0-"
    @"9][0-9]?|[a-z0-9-]*[a-z0-9]:(?:[\\x01-\\x08\\x0b\\x0c\\x0e-\\x1f\\x21"
    @"-\\x5a\\x53-\\x7f]|\\\\[\\x01-\\x09\\x0b\\x0c\\x0e-\\x7f])+)\\])";
    
    NSPredicate *regExPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegEx];
    return [regExPredicate evaluateWithObject:[email lowercaseString]];
}

@end
