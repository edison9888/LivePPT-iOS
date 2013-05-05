//
//  LPTLoginViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-4.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTLoginViewController.h"

#import "LPTJsonHttpClient.h"


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

- (IBAction)textFieldDoneEditing:(id)sender {
    [sender resignFirstResponder];
}

- (IBAction)loginButtonPressed:(id)sender {
    //从UI获取帐号和密码
    NSString *passwordStr  =[[NSString alloc] initWithString:self.passwordInput.text];
    NSString *emailStr  =[[NSString alloc] initWithString:self.emailInput.text];
    
    //组装变量
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:emailStr forKey:@"email"];
    [params setObject:passwordStr forKey:@"password"];
    
    //发出POST请求
    [[LPTJsonHttpClient sharedClient] postPath:@"/app/login" parameters:params
    success:^(AFHTTPRequestOperation *operation, id responseJSON) {
        NSString *isSuccessStr = [responseJSON valueForKeyPath:@"isSuccess"];
        id data = [responseJSON objectForKey:@"data"];
        if ([isSuccessStr isEqualToString:@"true"]){
            //登录成功
            //触发Segue跳转
            [self performSegueWithIdentifier:@"ShowTabSegue" sender:self];
        } else {
            //登录失败
            //显示错误信息AlertView
            UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:[data valueForKeyPath:@"message"] delegate:self cancelButtonTitle:@"明白" otherButtonTitles:nil];
            [alertView show];
        }
    } failure:^(AFHTTPRequestOperation *operation, NSError *error) {        
        //登录失败，显示错误信息AlertView
        UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录失败" message:@"请检查手机的网络连接。" delegate:self cancelButtonTitle:@"明白" otherButtonTitles:nil];
        [alertView show];
    }];
}
@end
