//
//  BaseHandler.h
//  HXYLibrary-iOS
//  基本的业务处理
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>

/**
 *  Handler处理完成时调用的回调
 */
typedef void(^CompleteBlock)();

/**
 *  Handler处理成功时调用的回调
 */
typedef void(^SuccessBlock)();

/**
 *  Handler处理失败时调用的回调
 */
typedef void(^FailureBlock)();

@interface BaseHandler : NSObject

/**
 *  获取请求URL
 *
 *  @param domainName
 *  @param path
 *
 *  @return 拼接好的URL
 */
+(NSString *)requestUrlWithDomain:(NSString *)domainName andPath:(NSString *)path;

@end
