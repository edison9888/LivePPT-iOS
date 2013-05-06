//
//  LPTWebSocketViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-7.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "SRWebSocket.h"
#import "LPTViewMeetingWebSocket.h"

@interface LPTWebSocketViewController : UIViewController<SRWebSocketDelegate>

@property LPTViewMeetingWebSocket* ws;
- (IBAction)wsPressed:(id)sender;

@end
