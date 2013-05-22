//
//  JsonResult.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-23.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "JsonResult.h"

@implementation JsonResult

-(id) initWithResponseJson:(id) responseJSON
{
    self = [super init];
    
    self.isSuccess = [[responseJSON valueForKeyPath:@"isSuccess"] boolValue];
    self.statusCode = [[responseJSON valueForKeyPath:@"statusCode"] intValue];
    self.message = [responseJSON valueForKeyPath:@"message"];
    self.dataJson = [responseJSON valueForKeyPath:@"data"];
    
    return self;
}

@end
