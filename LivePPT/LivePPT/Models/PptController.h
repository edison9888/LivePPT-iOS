//
//  PptController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-6.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "LPTPptViewController.h"

@interface PptController : NSObject

- (void)getPptList:(NSNumber *) userId controller:(LPTPptViewController *)controller;

@end
