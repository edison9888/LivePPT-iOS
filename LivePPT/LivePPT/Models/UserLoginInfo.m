//
//  UserLoginInfo.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-5.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "UserLoginInfo.h"

@implementation UserLoginInfo

@synthesize userId;
@synthesize email;
@synthesize displayName;

//序列化过正中用到的常量键名
static NSString *KEY_LoginInfo = @"LoginInfo";
static NSString *KEY_UerId = @"userId";
static NSString *KEY_Email = @"email";
static NSString *KEY_DisplayName = @"displayName";


//获取用户登录信息
+(UserLoginInfo *) getInfo
{
    NSMutableData *data = [[NSMutableData alloc] initWithContentsOfFile:[self dataFilePath]];
    UserLoginInfo *loginInfo;
    if ([data isEqual:NULL]) {
        loginInfo = nil;
    } else {
        NSKeyedUnarchiver *unArchiver = [[NSKeyedUnarchiver alloc] initForReadingWithData:data];
        loginInfo = [unArchiver decodeObjectForKey:KEY_LoginInfo];
        [unArchiver finishDecoding];
    }
    return loginInfo;
}

//持久化用户登录信息
+(void) saveInfo:(UserLoginInfo *)loginInfo
{
    NSMutableData *data = [[NSMutableData alloc] init];
    NSKeyedArchiver *archiver = [[NSKeyedArchiver alloc] initForWritingWithMutableData:data];
    [archiver encodeObject:loginInfo forKey:KEY_LoginInfo];
    [archiver finishEncoding];
    [data writeToFile:[self dataFilePath] atomically:YES];  
}

//登录信息是否可用
+(BOOL) isLoginInfoReady {
    UserLoginInfo *loginInfo = [UserLoginInfo getInfo];
    if (loginInfo==NULL || loginInfo.userId ==NULL || loginInfo.email ==NULL || loginInfo.displayName == NULL){
        return NO;
    }
    NSLog(@"Current LoginInfo:[UserId:%@, Email:%@, DisplayName:%@]",[loginInfo.userId stringValue], loginInfo.email, loginInfo.displayName);
    return YES;
}
    
//pragma NSCoding协议实现实现
- (void)encodeWithCoder:(NSCoder *)aCoder
{   //encoder
    [aCoder encodeObject:userId forKey:KEY_UerId];
    [aCoder encodeObject:email forKey:KEY_Email];
    [aCoder encodeObject:displayName forKey:KEY_DisplayName];
}
- (id)initWithCoder:(NSCoder *)aDecoder
{
    //decoder
    if (self = [super init]) {
        userId = [aDecoder decodeObjectForKey:KEY_UerId];
        email = [aDecoder decodeObjectForKey:KEY_Email];
        displayName = [aDecoder decodeObjectForKey:KEY_DisplayName];
    }
    return self;
}

//pragma NSCopying协议实现
- (id)copyWithZone:(NSZone *)zone
{
    UserLoginInfo *copy = [[[self class] allocWithZone:zone] init];
    copy.userId = [self.userId copyWithZone:zone];
    copy.email = [self.email copyWithZone:zone];
    copy.displayName = [self.displayName copyWithZone:zone];
    return copy;
}

// //////////////
//For Private Use

//获取归档文件路径
+ (NSString *)dataFilePath{
    NSArray *arr = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *filePath = [(NSString *)[arr objectAtIndex:0] stringByAppendingPathComponent:@"UserLoginInfoArchiver"];
    return filePath;
}



@end
