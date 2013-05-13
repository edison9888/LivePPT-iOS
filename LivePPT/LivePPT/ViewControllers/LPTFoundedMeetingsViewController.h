//
//  LPTFoundedMeetingsViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-13.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPTFoundedMeetingsViewController : UITableViewController

@property NSMutableArray *meetings;

-(void) refreshMeetingsData;

@end
