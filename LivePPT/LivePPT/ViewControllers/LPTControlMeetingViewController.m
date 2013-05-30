//
//  LPTControlMeetingViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-14.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTControlMeetingViewController.h"

#import "LPTJsonHttpClient.h"
#import "NetworkProperty.h"
#import "UIImageView+AFNetworking.h"

@interface LPTControlMeetingViewController ()

@end

@implementation LPTControlMeetingViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    [self setPageImgWithIndex:1];

    //显示Toolbar
    self.navigationController.toolbarHidden=NO;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)btnPrePagePressed:(id)sender {
    self.currentPageIndex--;
    if (self.currentPageIndex >= 1) {
        [self setPageImgWithIndex:self.currentPageIndex];
        [self setRemoteMeetingPageIndex:self.currentPageIndex];
    } else {
        self.currentPageIndex = 1;
    }
    
}

- (IBAction)btnNextPagePressed:(id)sender {
    self.currentPageIndex++;
    if (self.currentPageIndex <= [self.maxPageIndex integerValue]) {
        [self setPageImgWithIndex:self.currentPageIndex];
        [self setRemoteMeetingPageIndex:self.currentPageIndex];
    } else {
        self.currentPageIndex = self.maxPageIndex;
    }
}

- (void) prepareDataWithMeeting:(Meeting *)meeting
{
    self.meeting = meeting;
    self.maxPageIndex = meeting.ppt.pageCount;
}

-(void) setPageImgWithIndex:(NSUInteger *)pageIndex
{
    NSString *IMG_BASE_URL = [[NSString alloc] initWithFormat:@"%@%@", [NetworkProperty getHttpBaseUrlStr], @"/getpptpage"];
    NSString *urlStr = [[NSString alloc] initWithFormat:@"%@?pptid=%@&pageid=%i",IMG_BASE_URL,self.meeting.ppt.pptId, pageIndex];
    NSLog(@"img:%@",urlStr);
    NSURL *url = [NSURL URLWithString:urlStr];
    [self.currentPageImageView setImageWithURL:url];
    self.currentPageIndex = pageIndex;
}

-(void) setRemoteMeetingPageIndex:(NSUInteger *)pageIndex
{
    //组装变量
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:self.meeting.meetingId forKey:@"meetingId"];
    [params setObject:[[NSNumber alloc] initWithInteger:pageIndex] forKey:@"pageIndex"];
    
    NSString *urlStr = [[NSString alloc] initWithFormat:@"/app/setMeetingPageIndex", self.meeting.meetingId, self.currentPageIndex];
    
    NSLog(@"setting remote pageIndex:%i", pageIndex);
    
    //发送网络请求
    [[LPTJsonHttpClient sharedClient] postPath:urlStr parameters:params
                                      success:^(AFHTTPRequestOperation *operation, id responseJSON) {
                                          NSLog(@"setMeetingPageIndex Success:%@", responseJSON);
                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                          NSLog(@"setMeetingPageIndex Failed:%@",error);
                                      }];
}

@end
