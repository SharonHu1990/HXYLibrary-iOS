//
//  AppUtils.h
//  HXYLibrary-iOS
//  应用公共操作
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
 *  @param view           显示在view上
 *  @param labelText      显示的文字
 *  @param completedBlock 在结束后执行的回调
 *  @param showImage      是否显示图片
 */
+(void)showCompletedHUDOnView:(UIView *)view withLableText:(NSString *)labelText completedBlock:(HUDCompletedBlock)completedBlock showImage:(BOOL)showImage;

/**
 *  弹出正在加载状态的HUD
 *
 *  @param labelText      显示的文字
 *  @param executingBlock 在弹出HUD时执行的回调
 */

/**
 *  弹出正在加载状态的HUD
 *
 *  @param view           显示在view上
 *  @param labelText      显示的文字(可以为nil)
 */
+(void)showLoadingHUDOnView:(UIView *)view withLabelText:(NSString *)labelText;

/**
 *  取消hud
 *
 *  @param hud
 */
+(void)dismissHUD:(MBProgressHUD *)hud;


/********************* Verification Utils **********************/

//验证手机号码合法性
+ (BOOL)isLegalTelephone:(NSString*)phoneNumber;

//验证密码的合法性
+ (BOOL)isLegalPassword:(NSString*)password;

//验证昵称的合法性
+ (BOOL)isLegalUserName:(NSString*)username;

//验证邮箱的合法性
+ (BOOL)isLegalEmail:(NSString *)email;
@end
