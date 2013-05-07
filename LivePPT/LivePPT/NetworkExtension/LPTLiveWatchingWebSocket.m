//
//  LPTLiveWatchingWebSocket.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTLiveWatchingWebSocket.h"

@implementation LPTLiveWatchingWebSocket

static NSString *LIVE_WATCHING_WS_ADDRESS = @"ws://192.168.1.104:9000/viewWebsocket";

-(id) initWithDelegate:aDelegate{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:LIVE_WATCHING_WS_ADDRESS]];
    self = [super initWithURLRequest:request];
    self.delegate = aDelegate;
    return self;
}

@end
