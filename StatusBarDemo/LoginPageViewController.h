//
//  LoginPageViewController.h
//  StatusBarDemo
//
//  Created by Naresh K on 11/25/16.
//  Copyright © 2016 MaxSecure. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "AppDelegate.h"

@interface LoginPageViewController : NSViewController<NSTouchBarDelegate>
@property (strong) IBOutlet NSTouchBar *SecondTouchbar;

@end
