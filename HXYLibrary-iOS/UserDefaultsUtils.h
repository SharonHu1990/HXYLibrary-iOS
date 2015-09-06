//
//  UserDefaultsUtils.h
//  HXYLibrary-iOS
//  键值对操作
//  Created by 胡晓阳 on 15/8/31.
//  Copyright (c) 2015年 HXY. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserDefaultsUtils : NSObject


+(void)saveValue:(id)value forKey:(NSString *)key;

+(id)valueForKey:(NSString *)key;

+(BOOL)boolValueWithKey:(NSString *)key;

+(void)saveBoolValue:(BOOL)value withKey:(NSString *)key;

+(void)print;

@end
