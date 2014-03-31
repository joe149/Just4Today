//
//  JRInboxViewController.h
//  Dream River
//
//  Created by John Randak on 3/12/14.
//  Copyright (c) 2014 John Randak. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface JRInboxViewController : UIViewController {
    
    __weak IBOutlet UILabel *timer;
    NSTimer *myTicker;
}


@property (nonatomic, retain) UIImage *image;

@property (nonatomic, strong) IBOutlet UIImageView *backgroundImageHome;

- (IBAction)logout:(id)sender;

- (UIImage *)resizeImage:(UIImage *)image toWidth:(float)width andHeight:(float)height;

-(void)showActivity;

@end
