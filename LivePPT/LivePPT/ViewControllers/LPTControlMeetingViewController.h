//
//  LPTControlMeetingViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-14.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Meeting.h"

@interface LPTControlMeetingViewController : UIViewController

@property Meeting *meeting;
@property NSUInteger currentPageIndex;
@property NSNumber *maxPageIndex;

@property (strong, nonatomic) IBOutlet UIImageView *currentPageImageView;

- (IBAction)btnPrePagePressed:(id)sender;
- (IBAction)btnNextPagePressed:(id)sender;


- (void) prepareDataWithMeeting:(Meeting *)meeting;

@end
