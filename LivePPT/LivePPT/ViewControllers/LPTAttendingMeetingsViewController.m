//
//  LPTAttendingMeetingsViewController.m
//  LivePPT
//
//  Created by Bowen Liang on 13-5-8.
//  Copyright (c) 2013年 Fever. All rights reserved.
//

#import "LPTAttendingMeetingsViewController.h"

#import "LPTAttendingMeetingDetailsViewController.h"
#import "Meeting.h"
#import "UserLoginInfo.h"

@interface LPTAttendingMeetingsViewController ()

@end

@implementation LPTAttendingMeetingsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemRefresh target:self action:@selector(selectLeftAction:)];
    self.navigationItem.leftBarButtonItem = leftButton;

    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self refreshMeetingsData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
#warning Potentially incomplete method implementation.
    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
#warning Incomplete method implementation.
    // Return the number of rows in the section.
    return self.meetings.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"AttendingMeetingCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];
    
    // Configure the cell...
    NSUInteger meetingsCount = self.meetings.count;
    NSUInteger row = [indexPath row];
    if (meetingsCount>0){
        Meeting *meeting = self.meetings[row];
        cell.textLabel.text = meeting.topic;
    }
    
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
    [self performSegueWithIdentifier:@"ShowAttendingMeetingDetailsSegue" sender:self];
}

-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    NSString *segueId = [segue identifier];
    if ([segueId isEqualToString:@"ShowAttendingMeetingDetailsSegue"])
    {
        LPTAttendingMeetingDetailsViewController * amdvc = [segue destinationViewController];
        NSUInteger rowSelected = [[self.tableView indexPathForSelectedRow] row];
        [amdvc prepareDataWithMeeting:self.meetings[rowSelected]];
    }
}



-(void) refreshMeetingsData
{    
    NSNumber *userId = [UserLoginInfo getUserId];
    [[Meeting alloc] getAttendingMeetingsList:userId controller:self];    
}

- (IBAction)selectLeftAction:(id)sender
{
    [self refreshMeetingsData];
}

@end
