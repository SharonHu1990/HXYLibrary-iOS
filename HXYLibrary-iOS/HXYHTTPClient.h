//
//  HXYHTTPClient.h
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AFNetworking.h>
/**
 *  HTTP请求类型
 */
typedef enum : NSUInteger {
    HXYHTTPRequestGet,
    HXYHTTPReqestPost,
    HXYHTTPRequestPut,
    HXYHTTPRequestDelete
} HXYHTTPRequestType;

/**
 *  请求开始之前的预处理Block
 */
typedef void(^PreparedExecutionBlock)(void);

/**
 *  请求成功的回调处理块
 *
 *  @param responseObj 返回参数
 *
 *  @return 无返回值
 */
typedef void(^HTTPRequestSuccessBlock)(NSDictionary *responseObj);

/**
 *  请求失败的回调处理块
 *
 *  @param error 返回参数
 *
 *  @return 无返回值
 */
typedef void(^HTTPRequestFailureBlock)(NSError *error);

@interface HXYHTTPClient : NSObject

@property (nonatomic, assign) AFNetworkReachabilityStatus networkStatus;

+(HXYHTTPClient *)defaultClient;

/**
 *  HTTP请求（GET，POST，PUT，DELETE）
 *
 *  @param url                    请求地址
 *  @param requestType            请求类型
 *  @param preparedExecutionBlock 请求前预处理块
 *  @param success                请求成功处理块
 *  @param failure                请求失败处理块
 */
-(void)requestWithPath:(NSString *)url
           requestType:(HXYHTTPRequestType)requestType
            parameters:(id)parameters
     preparedExecution:(PreparedExecutionBlock)preparedExecutionBlock
               success:(HTTPRequestSuccessBlock)success
               failure:(HTTPRequestFailureBlock)failure;

/**
 *  HTTP多表请求（上传文件）
 *
 *  @param url                    请求地址
 *  @param data                   上传的文件数据
 *  @param name                   文件键
 *  @param fileName               文件名称
 *  @param mimeType               mimeType
 *  @param parameters             其他参数
 *  @param preparedExecutionBlock 请求前预处理块
 *  @param success                请求成功处理块
 *  @param failure                请求失败处理块
 */
-(void)multiPartRequestWithPath:(NSString *)url
                       fileData:(NSData *)data
                           name:(NSString *)name
                       fileName:(NSString *)fileName
                       mimeType:(NSString *)mimeType
                     parameters:(id)parameters
              preparedExecution:(PreparedExecutionBlock)preparedExecutionBlock
                        success:(HTTPRequestSuccessBlock)success
                        failure:(HTTPRequestFailureBlock)failure;




@end
