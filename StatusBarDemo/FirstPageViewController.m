//
//  FirstPageViewController.m
//  StatusBarDemo
//
//  Created by Naresh K on 11/25/16.
//  Copyright © 2016 MaxSecure. All rights reserved.
//

#import "FirstPageViewController.h"
 static NSTouchBarItemIdentifier launch=@"com.magnus.spaceships.launch";
static NSTouchBarItemIdentifier hyperspace=@"com.magnus.spaceships.hyperspace";

@interface FirstPageViewController ()

@end

@implementation FirstPageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    
    NSLog(@"ViewDIdLoad");
    
    [NSApp activateIgnoringOtherApps:YES];
    [self.view.layer display];
    
    // Remove us as the observer to the associated detail view controller's NSTouchBar instance.

    
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    //[delegate statusBarItemDidClick];
    delegate->inFirstPage = true;
    delegate->inLoginPage = false;
    
    [NSTimer scheduledTimerWithTimeInterval:2.0
                                     target:self
                                   selector:@selector(targetMethod)
                                   userInfo:nil
                                    repeats:NO];

}
-(void)targetMethod
{
    AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];

    NSViewController *newDetailViewController = self;
    // Here we want to bind or sync our own NSTouchBar instance with the detail view controller.
    [delegate unbind:@"touchBar"];
    [delegate bind:@"touchBar" toObject:newDetailViewController withKeyPath:@"touchBar" options:nil];
}
- (IBAction)LoginButtonClicked:(NSButton *)sender {
    
    
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];

    [delegate->popover setContentViewController:delegate->loginPageView];

    delegate->popover.behavior = NSPopoverBehaviorTransient;
    [delegate->popover showRelativeToRect:delegate->myButtonForReference.bounds ofView:delegate->myButtonForReference preferredEdge:NSMaxYEdge];
    NSViewController *newDetailViewController = delegate->loginPageView;
    // Here we want to bind or sync our own NSTouchBar instance with the detail view controller.
    [delegate unbind:@"touchBar"];
    [delegate bind:@"touchBar" toObject:newDetailViewController withKeyPath:@"touchBar" options:nil];
}




- (IBAction)RegisterButtonClicked:(NSButton *)sender {
    
     AppDelegate *delegate =(AppDelegate*) [[NSApplication sharedApplication] delegate];
    
    [delegate->popover setContentViewController:delegate->registerPageView];
    
    delegate->popover.behavior = NSPopoverBehaviorTransient;
    [delegate->popover showRelativeToRect:delegate->myButtonForReference.bounds ofView:delegate->myButtonForReference preferredEdge:NSMaxYEdge];
    NSViewController *newDetailViewController = delegate->registerPageView;
    // Here we want to bind or sync our own NSTouchBar instance with the detail view controller.
    [delegate unbind:@"touchBar"];
    [delegate bind:@"touchBar" toObject:newDetailViewController withKeyPath:@"touchBar" options:nil];
}

-(void)viewWillDisappear
{

    NSLog(@"viewWillDisappear ");

}


-(NSTouchBar *)makeTouchBar
{
    NSLog(@"called");
//    NSTouchBar *touch = [[NSTouchBar alloc] init];
//    touch.delegate =self;
//
//    touch.defaultItemIdentifiers = @[launch,hyperspace];

    _Mytouchbar.delegate=self;
    return _Mytouchbar;
}

//-(NSTouchBarItem *)touchBar:(NSTouchBar *)touchBar makeItemForIdentifier:(NSTouchBarItemIdentifier)identifier
//{
//    if([identifier isEqualToString:@"com.magnus.spaceships.launch"])
//    {
//        NSCustomTouchBarItem *item = [[NSCustomTouchBarItem alloc] initWithIdentifier:identifier];
//        NSButton *button1 = [[NSButton alloc] init];
//        [button1 setTitle:@"Launch"];
//        [button1 setTarget:self];
//        [button1 setAction:@selector(launch)];
//        item.view = button1;
//        return item;
//    }
//    
//    if([identifier isEqualToString:@"com.magnus.spaceships.hyperspace"])
//    {
//        NSCustomTouchBarItem *item = [[NSCustomTouchBarItem alloc] initWithIdentifier:identifier];
//        NSButton *button2 = [[NSButton alloc] init];
//        [button2 setTitle:@"Hyperspace"];
//        [button2 setTarget:self];
//        [button2 setAction:@selector(hyperspace)];
//        item.view = button2;
//        return item;
//        
//    }
//    
//    return nil;
//    
//}

-(void)launch
{
    NSLog(@"Launch button Clicked");
}

-(void)hyperspace
{
    NSLog(@"hyperspace button Clicked");
}




@end
