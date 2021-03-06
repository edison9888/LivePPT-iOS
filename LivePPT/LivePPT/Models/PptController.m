//
//  PptController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-6.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "PptController.h"

#import "JsonResult.h"
#import "LPTJsonHttpClient.h"
#import "Ppt.h"
#import "LPTPptViewController.h"

@implementation PptController

- (void)getPptList:(NSNumber *) userId controller:(LPTPptViewController *)controller;
{
    
    controller.pptArray = [[NSMutableArray alloc] init];
    
    //组装变量
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:userId forKey:@"userId"];
    
    //发送网络请求
    [[LPTJsonHttpClient sharedClient] getPath:@"/app/getPptList" parameters:params
                                       success:^(AFHTTPRequestOperation *operation, id responseJSON) {
                                           NSLog(@"getPptList Success");
                                           NSLog(@"%@", userId);
                                           //提取数据
                                           JsonResult *responseResult = [[JsonResult alloc] initWithResponseJson:responseJSON];
                                           
                                           if (responseResult.isSuccess){
                                               
                                               id data = responseResult.dataJson;
                                               
                                               NSLog(@"%i", [data count]);
                                               //组装数据
                                               for (NSUInteger index=0; index<[data count]; index++) {
                                                   Ppt *ppt = [[Ppt alloc] initWithJson:[data objectAtIndex:index]];
                                                   [controller.pptArray addObject:ppt];
                                               }
                                               [controller.tableView reloadData];
                                           }
                                           
                                       } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                           NSLog(@" getPptList Failed");
                                       }];
};

@end
