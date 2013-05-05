//
//  LPTMoreViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-5.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPTMoreViewController : UITableViewController

@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

- (IBAction)logoutButtonPressed:(id)sender;

@end
