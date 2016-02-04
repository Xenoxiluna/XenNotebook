//
//  OpenNoteTableViewController.h
//  XenNotes
//
//  Created by Quentin Berry on 1/30/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface OpenNoteTableView : NSObject <NSTableViewDataSource>{
    NSArray *existingNotebooks;
}

@property (weak) IBOutlet NSTableView *existingNotebookTableView;

@end
