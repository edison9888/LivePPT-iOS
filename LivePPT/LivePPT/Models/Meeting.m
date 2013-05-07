//
//  Meeting.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "Meeting.h"

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

@end
