//
//  LPTWebSocketViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-7.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTWebSocketViewController.h"

#import "LPTViewMeetingWebSocket.h"

@interface LPTWebSocketViewController ()

@end

@implementation LPTWebSocketViewController

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
    NSLog(@"view loaded");
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)wsPressed:(id)sender {
    self.ws=[[LPTViewMeetingWebSocket alloc] initT];
    [self.ws open];
}
@end
