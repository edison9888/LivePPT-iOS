//
//  LPTLoginViewController.h
//  LivePPT
//
//  Created by Bowen Liang on 13-5-4.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LPTLoginViewController : UIViewController


@property (weak, nonatomic) IBOutlet UITextField *emailInput;
@property (weak, nonatomic) IBOutlet UITextField *passwordInput;


- (IBAction)loginButtonPressed:(id)sender;


- (IBAction)textFieldDoneEditing:(id)sender;

@end
