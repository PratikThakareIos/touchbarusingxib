//
//  RegisterViewController.m
//  StatusBarDemo
//
//  Created by Naresh K on 11/25/16.
//  Copyright © 2016 MaxSecure. All rights reserved.
//

#import "RegisterViewController.h"

@interface RegisterViewController ()

@end

@implementation RegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
- (IBAction)BackClicked:(id)sender {
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    
    [delegate->popover setContentViewController:delegate->firstPageView];
    
    delegate->popover.behavior = NSPopoverBehaviorTransient;
    [delegate->popover showRelativeToRect:delegate->myButtonForReference.bounds ofView:delegate->myButtonForReference preferredEdge:NSMaxYEdge];
}
- (IBAction)NextClicked:(id)sender {
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    
    [delegate->popover setContentViewController:delegate->loginPageView];
    
    delegate->popover.behavior = NSPopoverBehaviorTransient;
    [delegate->popover showRelativeToRect:delegate->myButtonForReference.bounds ofView:delegate->myButtonForReference preferredEdge:NSMaxYEdge];
}
@end
