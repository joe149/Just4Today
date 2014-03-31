//
//  JRInboxViewController.m
//  Dream River
//
//  Created by John Randak on 3/12/14.
//  Copyright (c) 2014 John Randak. All rights reserved.
//

#import "JRInboxViewController.h"
#import <Parse/Parse.h>
#import <QuartzCore/QuartzCore.h>

@interface JRInboxViewController ()

@end

@implementation JRInboxViewController



- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self loadDate];
    
    //self.navigationController.navigationBar.translucent = NO;
    
    PFUser *currentUser = [PFUser currentUser];
    if (currentUser) {
        NSLog(@"Current User : %@", currentUser.username);
    }
    else {
        [self performSegueWithIdentifier:@"showLogin" sender:self];
    }
    
    UIImage *image = [UIImage imageNamed:@"home_page.png"];
    self.backgroundImageHome.image = image;
    
    

}

-(void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:animated];
    myTicker = [NSTimer scheduledTimerWithTimeInterval:1.0 target:self
                            selector:@selector(showActivity) userInfo:nil repeats:YES];
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier forIndexPath:indexPath];

    // Configure the cell...

    return cell;
}




- (IBAction)logout:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"showLogin" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([segue.identifier isEqualToString:@"showLogin"]) {
        [segue.destinationViewController setHidesBottomBarWhenPushed:YES];
    }
}

- (UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height {
    CGSize newSize = CGSizeMake(width, height);
    CGRect newRectangle = CGRectMake(0, 0, width, height);
    UIGraphicsBeginImageContext(newSize);
    [self.image drawInRect:newRectangle];
    UIImage *resizedImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return resizedImage;
}


#pragma mark - methods for timer 
-(void)loadDate {
    NSDate *now = [[NSDate alloc]init];
    
    NSDateComponents *comps = [[NSDateComponents alloc] init];
    [comps setYear:2012];
    [comps setMonth:07];
    [comps setDay:18];
    [comps setHour:0];
    [comps setMinute:00];
    [comps setSecond:01];
    
    NSDate *dateOfBirth = [[NSCalendar currentCalendar] dateFromComponents:comps];
    
    int secondsSinceEarlierDate = [now timeIntervalSinceDate:dateOfBirth];
    
    
    NSDate *date = [NSDate dateWithTimeIntervalSince1970:secondsSinceEarlierDate];
    NSDateFormatter *formatter = [[NSDateFormatter alloc] init];
    [formatter setDateFormat:@"y  :  DDD  :  HH  :  mm  :  ss"];
    // NSLog(@"%@", [formatter stringFromDate:date]);
    
    timer.text = [formatter stringFromDate:date];
}

-(void)showActivity {
    [self loadDate];
}


@end
