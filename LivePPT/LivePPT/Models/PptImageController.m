//
//  PptImageController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-23.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "PptImageController.h"

#import "AFNetworking.h"
#import "NetworkProperty.h"
#import "Ppt.h"

@implementation PptImageController

-(id) init
{
    self.sharedPptImageCache = [[NSURLCache alloc] initWithMemoryCapacity:512*1024 diskCapacity:1024*1024 diskPath:nil];
    return self;
}

-(UIImage*) getPptImageWithPpt:(Ppt*)ppt pageIndex:(NSUInteger)pageIndex
{
    if (pageIndex > [ppt.pageCount intValue]){
        //请求的页面序号超出PPT最大页码
        return NULL;
    } else {
        NSURLRequest *targetRequest = [self genImageRequestWithPptId:[ppt.pptId unsignedIntegerValue] pageIndex:pageIndex];
        NSCachedURLResponse *cachedResponse = [self.sharedPptImageCache cachedResponseForRequest:targetRequest];
        if (cachedResponse){
            //已缓存
            NSLog(@"已缓存%@-%i",ppt.pageCount, pageIndex);
            
            //缓存上下几页
            [self preCachePreAndNextImagesWithPptId:ppt pageIndex:pageIndex];
            
            return [[UIImage alloc] initWithData:cachedResponse.data];
        } else {
            
            //未缓存
            NSLog(@"未缓存%@-%i",ppt.pageCount, pageIndex);
            NSURLResponse *ress=nil;
            //发出同步请求指定页面
            NSData *data=[NSURLConnection sendSynchronousRequest:targetRequest returningResponse:&ress error:nil];
            
            //存入缓存
            NSCachedURLResponse *responseForCaching = [[NSCachedURLResponse alloc] initWithResponse:ress data:data];
            [self.sharedPptImageCache storeCachedResponse:responseForCaching forRequest:targetRequest];
            NSLog(@"同步缓存%@-%i",ppt.pageCount, pageIndex);
            
            //异步缓存上下几页
            [self preCachePreAndNextImagesWithPptId:ppt pageIndex:pageIndex];
            
            return [[UIImage alloc] initWithData:data];
        }
    }
}

// /////////////////
// Private Functions

-(void) preCachePreAndNextImagesWithPptId:(Ppt *)ppt pageIndex:(NSUInteger) pageIndex
{
    
    NSUInteger max = [ppt.pageCount unsignedIntegerValue];
    NSUInteger index = pageIndex+1;
    NSLog(@"preFetch%i%i%i", max,pageIndex,index);
    for (; index <=max && index<=pageIndex+3; index++) {
        NSLog(@"???异步缓存%i_%i", [ppt.pptId intValue], index);
        [self cacheImageWithPptId:[ppt.pptId intValue] pageIndex:index];
        
    }
    
}

//异步缓存指定页面
-(void) cacheImageWithPptId:(NSUInteger)pptId pageIndex:(NSUInteger) pageIndex
{
    NSLog(@"！！！异步缓存%i_%i", pptId, pageIndex);
    NSURLRequest* targetRequest = [self genImageRequestWithPptId:pptId pageIndex:pageIndex];
    [AFImageRequestOperation imageRequestOperationWithRequest:targetRequest imageProcessingBlock:^UIImage *(UIImage *image) {
        return NULL;
    } success:^(NSURLRequest *request, NSHTTPURLResponse *response, UIImage *image) {
        NSLog(@"KKK异步缓存%i_%i", pptId, pageIndex);
        NSData *imageData=UIImageJPEGRepresentation(image, 1);
        NSCachedURLResponse *responseForCaching = [[NSCachedURLResponse alloc] initWithResponse:response data:imageData];
        [self.sharedPptImageCache storeCachedResponse:responseForCaching forRequest:targetRequest];
        
    } failure:^(NSURLRequest *request, NSHTTPURLResponse *response, NSError *error) {
        NSLog(@"ERROR:%@",error);
    }];
}

-(NSURLRequest *) genImageRequestWithPptId:(NSUInteger *) pptId pageIndex:(NSUInteger *) pageIndex
{
    NSString *IMG_BASE_URL = [[NSString alloc] initWithFormat:@"%@%@", [NetworkProperty getHttpBaseUrlStr], @"/getpptpage"];
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@?pptid=%i&pageid=%i",IMG_BASE_URL,pptId, pageIndex];
    NSLog(@"img:%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    return [[NSURLRequest alloc] initWithURL:url];
}



@end
