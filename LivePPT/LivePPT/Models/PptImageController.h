//
//  PptImageController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-23.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "Ppt.h"

@interface PptImageController : NSObject

@property NSURLCache *sharedPptImageCache;

-(id) init;

-(UIImage*) getPptImageWithPpt:(Ppt*)ppt pageIndex:(NSUInteger *)pageIndex;

@end
