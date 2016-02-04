//
//  OpenNotebookWindowController.m
//  XenNotebook
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "OpenNotebookWindowController.h"
#import "NotebookController.h"

@interface OpenNotebookWindowController ()

@property (readwrite, strong) NotebookController *controller;

@end

@implementation OpenNotebookWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    NSLog(@"OpenNotebookWindow NIB Loaded.");
}

-(NSString *)windowNibName{
    return @"OpenNotebookWindow";
}

- (IBAction)createNotebook:(id)sender {
    _controller = [[NotebookController alloc] initWithWindowNibName:@"Notebook"];
    [_controller showWindow:nil];
    [_controller.window makeKeyAndOrderFront:self];
    
    [self close];
}

@end
