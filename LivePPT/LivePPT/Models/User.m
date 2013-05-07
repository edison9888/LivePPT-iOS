//
//  User.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "User.h"

@implementation User

- (id) initWithJson:dataJson
{
    self = [super init];
    
    self.userId = [dataJson valueForKeyPath:@"userId"];
    self.email = [dataJson valueForKeyPath:@"email"];
    self.displayName = [dataJson valueForKeyPath:@"displayName"];
    
    return self;
}

@end
