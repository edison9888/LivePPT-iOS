//
//  LPTAttendingMeetingDetailsViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Meeting.h"

@interface LPTAttendingMeetingDetailsViewController : UITableViewController

@property Meeting *meeting;


@property (weak, nonatomic) IBOutlet UILabel *meetingTopicLabel;

-(void) prepareDataWithMeeting:(Meeting *)meeting;

@end
