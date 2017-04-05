//
//  LoginPageViewController.m
//  StatusBarDemo
//
//  Created by Naresh K on 11/25/16.
//  Copyright © 2016 MaxSecure. All rights reserved.
//

#import "LoginPageViewController.h"

@interface LoginPageViewController ()

@end

@implementation LoginPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    delegate->inFirstPage = false;
    delegate->inLoginPage = true;

}
- (IBAction)BackClicked:(id)sender {
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    
    [delegate->popover setContentViewController:delegate->firstPageView];
    
    delegate->popover.behavior = NSPopoverBehaviorTransient;
    [delegate->popover showRelativeToRect:delegate->myButtonForReference.bounds ofView:delegate->myButtonForReference preferredEdge:NSMaxYEdge];
}
- (IBAction)NextClicked:(id)sender {
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    
    [delegate->popover setContentViewController:delegate->registerPageView];
    
    delegate->popover.behavior = NSPopoverBehaviorTransient;
    [delegate->popover showRelativeToRect:delegate->myButtonForReference.bounds ofView:delegate->myButtonForReference preferredEdge:NSMaxYEdge];
}
-(NSTouchBar *)makeTouchBar
{
    NSLog(@"second called");
    //    NSTouchBar *touch = [[NSTouchBar alloc] init];
    //    touch.delegate =self;
    //
    //    touch.defaultItemIdentifiers = @[launch,hyperspace];
    
    _SecondTouchbar.delegate=self;
    return _SecondTouchbar;
}

@end
