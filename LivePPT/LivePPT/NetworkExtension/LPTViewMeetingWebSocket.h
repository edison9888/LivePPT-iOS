//
//  LPTViewMeetingWebSocket.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-7.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "SRWebSocket.h"

@interface LPTViewMeetingWebSocket : SRWebSocket<SRWebSocketDelegate>

-(id) initT;



- (void)webSocketDidOpen:(SRWebSocket *)webSocket;
- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message;
- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error;

@end
