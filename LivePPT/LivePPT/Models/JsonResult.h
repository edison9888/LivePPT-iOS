//
//  JsonResult.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-23.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JsonResult : NSObject

@property BOOL *isSuccess;
@property int statusCode;
@property NSString *message;
@property id dataJson;

-(JsonResult *) initWithResponseJson:(id) responseJSON;

@end
