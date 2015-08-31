//
//  HXYHTTPClient.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "HXYHTTPClient.h"
#import "Reachability.h"

@interface HXYHTTPClient ()
@property (nonatomic, strong) AFHTTPRequestOperationManager *manager;
@end

@implementation HXYHTTPClient

-(instancetype)init
{
    if (self = [super init]) {
        self.manager = [AFHTTPRequestOperationManager manager];
        //请求参数序列化类型
        self.manager.requestSerializer = [AFHTTPRequestSerializer serializer];
        //响应结果序列化类型
        self.manager.responseSerializer = [AFJSONResponseSerializer serializerWithReadingOptions:NSJSONReadingMutableLeaves];
    }
    return self;
}

+(HXYHTTPClient *)defaultClient
{
    static HXYHTTPClient *instance = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        instance = [[self alloc] init];
    });
    return instance;
}

-(void)requestWithPath:(NSString *)url
           requestType:(HXYHTTPRequestType)requestType
            parameters:(id)parameters
     preparedExecution:(PreparedExecutionBlock)preparedExecutionBlock
               success:(HTTPRequestSuccessBlock)success
               failure:(HTTPRequestFailureBlock)failure
{
    switch (requestType) {
        case HXYHTTPRequestGet:{
            [self.manager GET:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                success(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure(error);
            }];
        }
            break;
        case HXYHTTPReqestPost:{
            [self.manager POST:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                success(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure(error);
            }];
        }
            break;
        case HXYHTTPRequestPut:{
            [self.manager PUT:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                success(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure(error);
            }];
        }
            break;
        case HXYHTTPRequestDelete:{
            [self.manager DELETE:url parameters:parameters success:^(AFHTTPRequestOperation *operation, id responseObject) {
                success(responseObject);
            } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                failure(error);
            }];
        }
            break;
        default:
            break;
    }
}

-(void)multiPartRequestWithPath:(NSString *)url
                       fileData:(NSData *)data
                           name:(NSString *)name
                       fileName:(NSString *)fileName
                       mimeType:(NSString *)mimeType
                     parameters:(id)parameters
              preparedExecution:(PreparedExecutionBlock)preparedExecutionBlock
                        success:(HTTPRequestSuccessBlock)success
                        failure:(HTTPRequestFailureBlock)failure
{
    [self.manager POST:url parameters:parameters constructingBodyWithBlock:^(id<AFMultipartFormData> formData) {
        [formData appendPartWithFileData:data name:name fileName:fileName mimeType:mimeType];
    } success:^(AFHTTPRequestOperation *operation, id responseObject) {
        success(responseObject);
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
        failure(error);
    }];
    
}

@end
