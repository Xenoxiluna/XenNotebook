//
//  AppDelegate.m
//  XenNotebook
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "AppDelegate.h"
#import "OpenNotebookWindowController.h"

@interface AppDelegate ()

@property (weak) IBOutlet NSWindow *window;
@property (readwrite, strong) OpenNotebookWindowController *controller;

@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _controller = [[OpenNotebookWindowController alloc] initWithWindowNibName:@"OpenNotebookWindow"];
    [_controller showWindow:nil];
    [_controller.window makeKeyAndOrderFront:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}

@end
