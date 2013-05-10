//
//  LPTLiveWatchingMeetingViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTLiveWatchingMeetingViewController.h"

#import "UIImageView+AFNetworking.h"
#import "SRWebSocket.h"

@interface LPTLiveWatchingMeetingViewController ()

@end

@implementation LPTLiveWatchingMeetingViewController

static NSString *IMG_BASE_URL = @"http://localhost:9000/getpptpage";

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setPageImgWithIndex:[[NSNumber alloc] initWithInt:1]];
    
    self.ws = [[LPTLiveWatchingWebSocket alloc] initWithDelegate:self];
    [self.ws open];
    self.navigationItem.backBarButtonItem.alloc
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void) prepareDataWithMeeting:(Meeting*)meeting
{
    self.meeting = meeting;
}

-(void) setPageImgWithIndex:(NSNumber *)pageIndex
{
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@?pptid=%@&pageid=%@",IMG_BASE_URL,self.meeting.ppt.pptId, pageIndex];
    NSLog(@"img:%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.currentPageImageView setImageWithURL:url];
}


// implementing SRWebSocketDelegate methods
- (void)webSocketDidOpen:(SRWebSocket *)webSocket{
    NSLog(@"WS_OPEN!! [%@]", [webSocket url]);
    [webSocket send:[self.meeting.meetingId stringValue]];
}

- (void)webSocket:(SRWebSocket *)webSocket didReceiveMessage:(id)message
{
    NSLog(@"WS mess recieved:%@", message);
    NSArray *splitedMess = [message componentsSeparatedByString:@"-"];
    NSNumber *pageIndex = [[NSNumber alloc] initWithInt:[splitedMess[1] intValue]];
    [self setPageImgWithIndex:pageIndex];
}


- (void)webSocket:(SRWebSocket *)webSocket didFailWithError:(NSError *)error{
    NSLog(@"WS_FAILED! :%@",error);
}

@end
