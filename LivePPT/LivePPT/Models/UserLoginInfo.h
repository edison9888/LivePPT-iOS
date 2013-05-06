//
//  UserLoginInfo.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-5.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UserLoginInfo : NSObject<NSCopying, NSCoding>

@property NSNumber *userId;
@property NSString *email;
@property NSString *displayName;

+(UserLoginInfo *) getInfo;
+(void) saveInfo:(UserLoginInfo *) loginInfo;
+(BOOL) isLoginInfoReady;
+(NSNumber *) getUserId;

@end