//
//  LPTHttpClient.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-5.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTJsonHttpClient.h"
#import "AFJSONRequestOperation.h"

@implementation LPTJsonHttpClient

static NSString * const kAFAppDotNetAPIBaseURLString = @"http://192.168.1.101:9000";

+ (LPTJsonHttpClient *)sharedClient {
    static LPTJsonHttpClient *_sharedClient = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        _sharedClient = [[LPTJsonHttpClient alloc] initWithBaseURL:[NSURL URLWithString:kAFAppDotNetAPIBaseURLString]];
    });
    
    return _sharedClient;
}

- (id)initWithBaseURL:(NSURL *)url {
    self = [super initWithBaseURL:url];
    if (!self) {
        return nil;
    }
    
    [self registerHTTPOperationClass:[AFJSONRequestOperation class]];
    
	[self setDefaultHeader:@"Accept" value:@"application/json"];
    
    return self;
}


@end
