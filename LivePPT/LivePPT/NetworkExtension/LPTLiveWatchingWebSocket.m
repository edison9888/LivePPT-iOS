//
//  LPTLiveWatchingWebSocket.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTLiveWatchingWebSocket.h"

#import "NetworkProperty.h"

@implementation LPTLiveWatchingWebSocket

-(id) initWithDelegate:(id)aDelegate{
    NSString *LIVE_WATCHING_WS_ADDRESS = [[NSString alloc] initWithFormat:@"%@/viewWebsocket", [NetworkProperty getWSBaseUrlStr]];
        
//    LIVE_WATCHING_WS_ADDRESS = @"ws://live-ppt.com:9000/viewWebsocket";
    
    NSLog(LIVE_WATCHING_WS_ADDRESS);
    
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:LIVE_WATCHING_WS_ADDRESS]];
    
    self = [super initWithURLRequest:request];
    self.delegate = aDelegate;
    
    return self;
}

@end
