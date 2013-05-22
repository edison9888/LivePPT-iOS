//
//  LPTLiveWatchingMeetingViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "LPTLiveWatchingWebSocket.h"
#import "Meeting.h"
#import "PptImageController.h"
#import "SRWebSocket.h"

@interface LPTLiveWatchingMeetingViewController : UIViewController<SRWebSocketDelegate>

@property Meeting *meeting;
@property PptImageController *pptImageController;
@property LPTLiveWatchingWebSocket *ws;

@property (weak, nonatomic) IBOutlet UIImageView *currentPageImageView;

-(void) prepareDataWithMeeting:(Meeting*)meeting;

@end
