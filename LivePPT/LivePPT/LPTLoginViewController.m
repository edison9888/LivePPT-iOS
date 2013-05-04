//
//  LPTLoginViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-4.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTLoginViewController.h"

@interface LPTLoginViewController ()

@end

@implementation LPTLoginViewController

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
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setPasswordInput:nil];
    [self setEmailInput:nil];
    [super viewDidUnload];
}

- (void) keyboardWillHidden:(NSNotification *) notification
{
    NSLog(@"key wil hide");
}


-(void)keyboardWillShow:(NSNotification *) notification
{
    NSLog(@"key wil show");
}

- (IBAction)loginButtonPressed:(id)sender {
    [self performSegueWithIdentifier:@"ShowTabSegue" sender:self];
}
@end
