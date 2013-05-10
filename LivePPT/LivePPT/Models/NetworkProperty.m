//
//  NetworkProperty.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-9.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "NetworkProperty.h"

@implementation NetworkProperty

+(NSString *) getHttpBaseUrlStr
{
    NSString *baseHttpUrlStr = [[NSString alloc] initWithFormat:@"http://%@", [NetworkProperty getDomainWithPort]];
    return  baseHttpUrlStr;
}

+(NSString *) getWSBaseUrlStr
{
    NSString *baseWSUrlStr = [[NSString alloc] initWithFormat:@"ws://%@", [NetworkProperty getDomainWithPort]];
    return  baseWSUrlStr;
}

+(NSString *) getDomainWithPort
{
    NSString *domain = [NetworkProperty getDomain];
    NSString *port = [NetworkProperty getDefaultPort];
    return [[NSString alloc] initWithFormat:@"%@:%@", domain, port];
}

+(NSString *) getDomain
{
    NSMutableDictionary *dataDic = [NetworkProperty getNetworkPropertyDic];
    NSString *domain = [dataDic objectForKey:@"ServerDomain"];
    return domain;
}

// ////////////
// Private Funs
+(NSString *) getNetworkPropertyPlistPath
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"NetworkProperty" ofType:@"plist"];
    return path;
}

+(NSMutableDictionary *) getNetworkPropertyDic
{
    NSString *plistPath = [NetworkProperty getNetworkPropertyPlistPath];
    NSMutableDictionary *data = [[NSMutableDictionary alloc] initWithContentsOfFile:plistPath];
    return data;
}

+(NSString *) getDefaultPort
{
    NSMutableDictionary *dataDic = [NetworkProperty getNetworkPropertyDic];
    NSString *domain = [dataDic objectForKey:@"Port"];
    return domain;
}

@end
