//
//  NotebookController.h
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@class Notebook;
@class Section;
@class Note;

@interface NotebookController : NSWindowController <NSOutlineViewDataSource, NSOutlineViewDelegate, NSTextViewDelegate>

@property (unsafe_unretained) IBOutlet NSTextView *noteText;
@property (strong, nonatomic) Notebook *notebook;
@property (strong, nonatomic) NSMutableArray *list;
@property (weak) IBOutlet NSOutlineView *notebookSourceListOutlineView;

- (IBAction)addSection:(id)sender;
- (IBAction)addNote:(id)sender;
- (IBAction)removeItem:(id)sender;
- (IBAction)endEditingText:(id)sender;

@end
