//
//  Ppt.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-6.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "Ppt.h"

@implementation Ppt

- (id) initWithJson:dataJson{
    Ppt *ppt = [[Ppt alloc] init];
    
    ppt.time = [dataJson valueForKeyPath:@"time"];
    ppt.title = [dataJson valueForKeyPath:@"title"];
    ppt.pptId = [dataJson valueForKeyPath:@"pptId"];
    ppt.size = [dataJson valueForKeyPath:@"size"];
    
    return ppt;
}

@end
