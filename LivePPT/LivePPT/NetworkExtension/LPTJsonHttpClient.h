//
//  LPTHttpClient.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-5.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "AFHTTPClient.h"

@interface LPTJsonHttpClient : AFHTTPClient

+ (LPTJsonHttpClient *)sharedClient;

@end
