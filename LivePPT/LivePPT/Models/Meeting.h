//
//  Meeting.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LPTAttendingMeetingsViewController.h"
#import "Ppt.h"
#import "User.h"

@interface Meeting : NSObject

@property NSNumber *meetingId;
@property Ppt *ppt;
@property User *founder;
@property NSString *topic;

- (id) initWithJson:dataJson;

- (void)getAttendingMeetingsList:(NSNumber *) userId controller:(LPTAttendingMeetingsViewController *)controller;

@end
