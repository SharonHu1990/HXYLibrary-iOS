//
//  BaseHandler.m
//  HXYLibrary-iOS
//
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import "BaseHandler.h"

@implementation BaseHandler

+(NSString *)requestUrlWithDomain:(NSString *)domainName andPath:(NSString *)path
{
    return [domainName stringByAppendingString:path];
}

@end
