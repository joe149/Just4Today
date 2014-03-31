//
//  JRLoginViewController.h
//  Dream River
//
//  Created by John Randak on 3/14/14.
//  Copyright (c) 2014 John Randak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRLoginViewController : UIViewController

@property (weak, nonatomic) IBOutlet UITextField *usernameField;
@property (weak, nonatomic) IBOutlet UITextField *passwordField;

- (IBAction)login:(id)sender;

@end
