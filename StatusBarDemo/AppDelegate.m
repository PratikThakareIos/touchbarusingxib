//
//  AppDelegate.m
//  StatusBarDemo
//
//  Created by Naresh K on 11/25/16.
//  Copyright © 2016 MaxSecure. All rights reserved.
//

#import "AppDelegate.h"
static NSTouchBarItemIdentifier WindowControllerLabelIdentifier = @"com.TouchBarCatalog.windowController.label";
@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate


- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
  
    // Here we just opt-in for allowing our bar to be customized throughout the app.
    if ([[NSApplication sharedApplication] respondsToSelector:@selector(isAutomaticCustomizeTouchBarMenuItemEnabled)])
    {
        [NSApplication sharedApplication].automaticCustomizeTouchBarMenuItemEnabled = YES;
    }

    inLoginPage = false;
    inFirstPage = true;

    
    self->popover = [[NSPopover alloc] init];
    
    
    registerPageView = [[RegisterViewController alloc] initWithNibName:@"RegisterViewController" bundle:nil];
    
    firstPageView = [[FirstPageViewController alloc] initWithNibName:@"FirstPageViewController" bundle:nil];
    
    loginPageView = [[LoginPageViewController alloc] initWithNibName:@"LoginPageViewController" bundle:nil];
    
    self->statusItem = [[NSStatusBar systemStatusBar] statusItemWithLength:NSSquareStatusItemLength];
    
    NSImage* image = [NSImage imageNamed:@"cloud.png"];
    self->statusItem.button.image = image;
    self->statusItem.highlightMode = NO;
    self->statusItem.button.action = @selector(statusBarItemDidClick);
   
    myButtonForReference = self->statusItem.button;
    
      [self statusBarItemDidClick];


}
- (NSTouchBar *)makeTouchBar
{
    NSTouchBar *bar = [[NSTouchBar alloc] init];
    bar.delegate = self;
    
    // Set the default ordering of items.
    bar.defaultItemIdentifiers =
    @[WindowControllerLabelIdentifier, NSTouchBarItemIdentifierOtherItemsProxy];
    
    return bar;
}

- (nullable NSTouchBarItem *)touchBar:(NSTouchBar *)touchBar makeItemForIdentifier:(NSTouchBarItemIdentifier)identifier
{
    if ([identifier isEqualToString:WindowControllerLabelIdentifier])
    {
        NSTextField *theLabel = [NSTextField labelWithString:@"Menucar"];
        
        NSCustomTouchBarItem *customItemForLabel =
        [[NSCustomTouchBarItem alloc] initWithIdentifier:WindowControllerLabelIdentifier];
        customItemForLabel.view = theLabel;
        
        // We want this label to always be visible no matter how many items are in the NSTouchBar instance.
        customItemForLabel.visibilityPriority = NSTouchBarItemPriorityHigh;
        
        return customItemForLabel;
    }
    
    return nil;
}


- (void)statusBarItemDidClick
{
    [NSApp activateIgnoringOtherApps:YES];
   
    
    if(inFirstPage)
    {
      //  firstPageView = [[FirstPageViewController alloc] init];
        [self->popover setContentSize:firstPageView.preferredContentSize];
        [self->popover setContentViewController:firstPageView];
        

        self->popover.behavior = NSPopoverBehaviorTransient;
        [self->popover showRelativeToRect:myButtonForReference.bounds ofView:myButtonForReference preferredEdge:NSMaxYEdge];

       
    }
    
    if(inLoginPage)
    {
        
       // loginPageView = [[LoginPageViewController alloc] init];
      //  self->popover = [[NSPopover alloc] init];
        [self->popover setContentViewController:loginPageView];
        
        
   //     self->popover.contentSize = loginPageView.preferredContentSize;
        self->popover.behavior = NSPopoverBehaviorTransient;
        [self->popover showRelativeToRect:myButtonForReference.bounds ofView:myButtonForReference preferredEdge:NSMaxYEdge];

    }
}





- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
-(BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
{
    
    
    if(flag)
    {
        return NO;
    }
    else
    {
        [self statusBarItemDidClick];// Window that you want open while click on dock app icon
        return YES;
        
    }
    
}

@end
