//
//  LPTPptDetailsViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-6.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "Ppt.h"

@interface LPTPptDetailsViewController : UITableViewController

@property Ppt* ppt;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *uploadTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *fileSizeLabel;

- (void)preparePptDetailsWithPpt:(Ppt*)ppt;

@end
