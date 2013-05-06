//
//  Ppt.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-6.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Ppt : NSObject

@property NSNumber *pptId;
@property NSString *title;
@property NSString *time;
@property NSNumber *size;

- (id) initWithJson:dataJson;

@end
