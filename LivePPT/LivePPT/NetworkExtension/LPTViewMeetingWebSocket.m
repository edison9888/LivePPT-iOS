//
//  LPTViewMeetingWebSocket.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-7.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTViewMeetingWebSocket.h"

@implementation LPTViewMeetingWebSocket

-(id) initT{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:[NSURL URLWithString:@"ws://192.168.1.101:9000/app/testWS"]];
    self = [super initWithURLRequest:request];
    self.delegate = self;
    return self;
}


// implementing SRWebSocketDelegate methods
- (void)webSocketDidOpen:(SRWebSocket *)webSocket{
    NSLog(@"OPEN!!");
    [self send:@"yea"];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"mess Recieved.");
    NSLog(@"%@",message);
}


- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    NSLog(@"ERROE!");
}

@end
