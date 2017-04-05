//
//  AppDelegate.h
//  StatusBarDemo
//
//  Created by Naresh K on 11/25/16.
//  Copyright © 2016 MaxSecure. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "FirstPageViewController.h"
#import "LoginPageViewController.h"
#import "RegisterViewController.h"

@class FirstPageViewController;
@class LoginPageViewController;
@class RegisterViewController;
@class pratiikWindow;
@interface AppDelegate :NSWindowController <NSApplicationDelegate,NSTouchBarDelegate>
{
    @public
    NSStatusBarButton *myButtonForReference;
    
    @public
    NSStatusItem* statusItem;
    @public
    NSPopover *popover;
    FirstPageViewController *firstPageView;
    @public
    LoginPageViewController *loginPageView;
    @public
    RegisterViewController *registerPageView;
    @public
    pratiikWindow *pratik;
    
    // add Flag for every page
    @public
    BOOL inLoginPage;
    @public
    BOOL inFirstPage;
}

- (void)statusBarItemDidClick;


@end

