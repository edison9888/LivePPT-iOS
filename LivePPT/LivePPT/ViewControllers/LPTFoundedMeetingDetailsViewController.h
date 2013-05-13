//
//  LPTFoundedMeetingDetailsViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-14.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Meeting.h"

@interface LPTFoundedMeetingDetailsViewController : UITableViewController

@property Meeting *meeting;

@property (weak, nonatomic) IBOutlet UILabel *topicLabel;

- (IBAction)btnEnterControlMeetingPressed:(id)sender;

- (void) prepareDataWithMeeting:(Meeting *) meeting;

@end
