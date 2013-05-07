//
//  Meeting.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "Meeting.h"

#import "LPTAttendingMeetingsViewController.h"
#import "LPTJsonHttpClient.h"

@implementation Meeting

- (id) initWithJson:dataJson
{
    self = [super init];
    
    self.meetingId = [dataJson valueForKeyPath:@"meetingId"];
    self.ppt = [[Ppt alloc] initWithJson:[dataJson valueForKeyPath:@"ppt"]];
    self.founder = [[User alloc] initWithJson:[dataJson valueForKeyPath:@"founder"]];
    self.topic = [dataJson valueForKeyPath:@"topic"];
    
    return self;
}

- (void)getAttendingMeetingsList:(NSNumber *) userId controller:(LPTAttendingMeetingsViewController *)controller
{
    
    controller.meetings = [[NSMutableArray alloc] init];
    
    //组装变量
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:userId forKey:@"userId"];
    
    //发送网络请求
    [[LPTJsonHttpClient sharedClient] postPath:@"/app/getAttendingMeetingsList" parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id responseJSON) {
                                           NSLog(@"getAttendingMeetingsList Success");
                                           //提取数据
                                           NSString *isSuccessStr = [responseJSON valueForKeyPath:@"isSuccess"];
                                           id data = [responseJSON objectForKey:@"data"];
                                           
                                           NSLog(@"%i", [data count]);
                                           //组装数据
                                           for (NSUInteger index=0; index<[data count]; index++) {
                                               Meeting *meeting = [[Meeting alloc] initWithJson:[data objectAtIndex:index]];
                                               [controller.meetings addObject:meeting];
                                           }
                                           [controller.tableView reloadData];
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSLog(@"Failed");
                                       }];
};

@end
