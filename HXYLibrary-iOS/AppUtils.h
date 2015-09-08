//
//  AppUtils.h
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MBProgressHUD.h>

//点击对话框确认按钮事件回调
typedef void(^AlertConfirmActionBlock)();

//加载HUD时执行的回调
typedef void(^HUDExecutingBlock)();

//加载HUD完成后的回调
typedef void(^HUDCompletedBlock)();


@interface AppUtils : NSObject

/********************* System Utils **********************/

//弹出系统对话框
+(void)showSystemAlertWithTitle:(NSString *)title
                        message:(NSString *)msg
              cancelButtonTitle:(NSString *)cancelButtonTitle
       confirmCancelButtonTitle:(NSString *)confirmButtonTitle
                  confirmAction:(AlertConfirmActionBlock)confirmActionBlock;


/********************* MBProgressHUD Utils **********************/

/**
 *  弹出加载完成的HUD
 *
 *  @param labelText      显示的文字
 *  @param completedBlock 在结束后执行的回调
 */
+(void)showCompletedHUDOnView:(UIView *)view withLableText:(NSString *)labelText completedBlock:(HUDCompletedBlock)completedBlock;

/**
 *  弹出正在加载状态的HUD
 *
 *  @param labelText      显示的文字
 *  @param executingBlock 在弹出HUD时执行的回调
 */
+(void)showLoadingHUDOnView:(UIView *)view withLabelText:(NSString *)labelText executingBlock:(HUDExecutingBlock)executingBlock;

/**
 *  取消hud
 *
 *  @param hud <#hud description#>
 */
+(void)dismissHUD:(MBProgressHUD *)hud;


/********************* Verification Utils **********************/

//验证手机号码合法性
+ (BOOL)isLegalTelephone:(NSString*)phoneNumber;

//验证密码的合法性
+ (BOOL)isLegalPassword:(NSString*)password;

//验证昵称的合法性
+ (BOOL)isLegalUserName:(NSString*)username;
@end
