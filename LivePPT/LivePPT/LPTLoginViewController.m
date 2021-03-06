//
//  LPTLoginViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-4.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTLoginViewController.h"

#import "JsonResult.h"
#import "LPTJsonHttpClient.h"
#import "UserLoginInfo.h"


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

- (void)viewDidAppear:(BOOL)animated{
    if ([UserLoginInfo isLoginInfoReady]){
        [self performSegueWithIdentifier:@"ShowTabSegue" sender:self];
    }
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

//按钮事件 - 按下登录按钮
- (IBAction)loginButtonPressed:(id)sender {
    //从UI获取帐号和密码
    NSString *passwordStr  =[[NSString alloc] initWithString:self.passwordInput.text];
    NSString *emailStr  =[[NSString alloc] initWithString:self.emailInput.text];
    
    //组装变量
    NSMutableDictionary *params = [[NSMutableDictionary alloc] init];
    [params setObject:emailStr forKey:@"email"];
    [params setObject:passwordStr forKey:@"password"];
    
    //发出POST请求
    [[LPTJsonHttpClient sharedClient] getPath:@"/app/login" parameters:params
                                      success:^(AFHTTPRequestOperation *operation, id responseJSON) {
                                          NSLog(@"LoginSuccess");
                                          JsonResult *responseResult = [[JsonResult alloc] initWithResponseJson:responseJSON];
                                          
                                          if (responseResult.isSuccess){
                                              //登录成功
                                              
                                              //取出data
                                              id data = responseResult.dataJson;
                                              
                                              //在本地持久化登录信息
                                              [self saveLoginInfo:data];
                                              UserLoginInfo *loginInfo = [UserLoginInfo getInfo];
                                              NSLog(@"LoginInfo Saved:[UserId:%@, Email:%@, DisplayName:%@]",[loginInfo.userId stringValue], loginInfo.email, loginInfo.displayName);
                                              //触发Segue跳转至Tab
                                              [self performSegueWithIdentifier:@"ShowTabSegue" sender:self];
                                          } else {
                                              //登录失败
                                              
                                              NSString *messageContent;
                                              messageContent = [[NSString alloc] initWithString:[responseJSON valueForKeyPath:@"message"]];
                                              
                                              switch (responseResult.statusCode) {
                                                  case 1100:
                                                      messageContent = @"账号/密码不配对";
                                                      break;
                                                  case 1101:
                                                      messageContent = @"不存在该用户";
                                                      break;
                                                default:
                                                      messageContent = @"未知错误";
                                              }
                                              
                                              //显示错误信息AlertView
                                              [self showLoginErrorAlertViewWithMessage:messageContent];
                                          }
                                      } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                                          NSLog(@"LoginFailed:%@",error);
                                          //登录失败，显示错误信息AlertView
                                          [self showLoginErrorAlertViewWithMessage:@"请检查网络连接"];
                                          
                                      }];
}

// //////////////
//For Private Use
-(void) saveLoginInfo:(id) userData
{
    UserLoginInfo *loginInfo = [[UserLoginInfo alloc] init];
    loginInfo.userId = [userData valueForKeyPath:@"userId"];
    loginInfo.email = [userData valueForKeyPath:@"email"];
    loginInfo.displayName = [userData valueForKeyPath:@"displayName"];
    [UserLoginInfo saveInfo:loginInfo];
}


-(void) showLoginErrorAlertViewWithMessage:(NSString*)aMessage
{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:@"登录未成功" message:aMessage delegate:self cancelButtonTitle:@"明白" otherButtonTitles:nil];
    [alertView show];
}


@end
