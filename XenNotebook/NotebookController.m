//
//  NotebookController.m
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "NotebookController.h"
#import "Notebook.h"
#import "Section.h"
#import "Note.h"


@interface NotebookController ()

@end

@implementation NotebookController

- (id)init
{
    self = [super initWithWindowNibName:@"Notebook"];
    return self;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    _notebook = [[Notebook alloc] init];
    
    [_notebook.notes setObject:[NSMutableArray arrayWithObjects:[[Section alloc] init],[[Section alloc] init], nil ] forKey:@"notes"];
    Section *addO = [[_notebook.notes objectForKey:@"notes"] objectAtIndex:1];
    //[addO.notes setObject:[NSMutableArray arrayWithObjects:[[Note alloc] init], [[Note alloc] init],  nil ] forKey:@"children"];
    [addO.notes addObjectsFromArray:[NSMutableArray arrayWithObjects:[[Note alloc] init], [[Note alloc] init],  nil ]];
    
    [[_notebook.notes objectForKey:@"notes"] addObjectsFromArray:[NSMutableArray arrayWithObjects:[[Note alloc] init], [[Note alloc] init], nil]];
    
    [_notebookSourceListOutlineView reloadData];
    
#if DEBUG
    NSLog(@"Notebook NIB Loaded.");
#endif
}

-(NSString *)windowNibName{
    return @"Notebook";
}

#pragma mark - outlineView

-(id)outlineView:(NSOutlineView *)outlineView child:(NSInteger)index ofItem:(id)item{
    if (item == nil) {
        //item is nil when the outline view wants to inquire for root level items
        return [[_notebook.notes objectForKey:@"notes"] objectAtIndex:index];
    }
    
    if ([item isKindOfClass:[NSMutableDictionary class]]) {
        return [[item objectForKey:@"notes"] objectAtIndex:index];
    }else if([item isKindOfClass:[Section class]]){
        return [((Section *)item).notes objectAtIndex:index];
    }else if ([item isKindOfClass:[Note class]]){
        Note *note = item;
        return note;
    }
    return nil;
}

-(BOOL)outlineView:(NSOutlineView *)outlineView isItemExpandable:(id)item{
    if ([item isKindOfClass:[NSMutableDictionary class]] || [item isKindOfClass:[NSMutableArray class]] || [item isKindOfClass:[Section class]]) {
        return YES;
    }else{
        return NO;
    }
}

-(NSInteger)outlineView:(NSOutlineView *)outlineView numberOfChildrenOfItem:(id)item{
    if ([item isKindOfClass:[Section class]]) {
        return [((Section *)item).notes count];
    }else{
        return [[_notebook.notes objectForKey:@"notes"] count];
    }
}

- (NSView *)outlineView:(NSOutlineView *)outlineView viewForTableColumn:(NSTableColumn *)tableColumn item:(id)item{
#if DEBUG
    NSLog(@"%@", [item class]);
#endif
    if ([item isKindOfClass:[Section class]]) {
        NSTableCellView *cellView = [outlineView makeViewWithIdentifier:@"HeaderCell" owner:self];
        cellView.textField.stringValue = [((Section *)item) header];
        return cellView;
    } else if([item isKindOfClass:[Note class]]){
        NSTableCellView *cellView = [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
        cellView.textField.stringValue = [((Note *)item) header];
        return cellView;
    } else{
        //return [outlineView makeViewWithIdentifier:@"DataCell" owner:self];
        return nil;
    }
}

#pragma mark - Notifications

-(void)outlineViewSelectionDidChange:(NSNotification *)notification{
    id selectedItem = [_notebookSourceListOutlineView itemAtRow:[_notebookSourceListOutlineView selectedRow]];
    
    if ([selectedItem isKindOfClass:[Section class]]) {
#if DEBUG
        NSLog(@"Section class");
#endif
    }else if ([selectedItem isKindOfClass:[Note class]]){
#if DEBUG
        NSLog(@"Note class");
#endif
        [_noteText setString:((Note *) selectedItem).note];
    }
}

-(void)textDidEndEditing:(NSNotification *)notification{
#if DEBUG
    NSLog(@"Text Changed!");
#endif
    id selectedItem = [_notebookSourceListOutlineView itemAtRow:[_notebookSourceListOutlineView selectedRow]];
    
    ((Note *)selectedItem).note = [[_noteText textStorage] string];
}

#pragma mark - button actions

- (IBAction)addSection:(id)sender {
    id selectedItem = [_notebookSourceListOutlineView itemAtRow:[_notebookSourceListOutlineView selectedRow]];
    Section *addSec = [[Section alloc] init];
    
    if ([selectedItem isKindOfClass:[Section class]]) {
        [((Section *)selectedItem).notes addObject:addSec];
    } else{
        [[_notebook.notes objectForKey:@"notes"] addObject:addSec];
    }
    
    [_notebookSourceListOutlineView reloadData];
}

- (IBAction)addNote:(id)sender {
    id selectedItem = [_notebookSourceListOutlineView itemAtRow:[_notebookSourceListOutlineView selectedRow]];
    Note *addNot = [[Note alloc] init];
    
    if ([selectedItem isKindOfClass:[Section class]]) {
        [((Section *)selectedItem).notes addObject:addNot];
    } else{
        [[_notebook.notes objectForKey:@"notes"] addObject:addNot];
    }
    [_notebookSourceListOutlineView reloadData];
}

- (IBAction)removeItem:(id)sender {
    // Which row is selected?
    NSIndexSet *rows = [_notebookSourceListOutlineView selectedRowIndexes];
    
    // Is the selection empty?
    if ([rows count] == 0) {
        NSBeep();
        return;
    }
    id selectedItem = [_notebookSourceListOutlineView itemAtRow:[_notebookSourceListOutlineView selectedRow]];
    
    id parent = [_notebookSourceListOutlineView parentForItem:selectedItem];
    if ([parent isKindOfClass:[Section class]]) {
        [((Section *)parent).notes removeObjectIdenticalTo:selectedItem];
    }else{
        [[_notebook.notes objectForKey:@"notes"] removeObjectIdenticalTo:selectedItem];
    }
    [_notebookSourceListOutlineView reloadData];
}

- (IBAction)endEditingText:(id)sender {
    id selectedItem = [_notebookSourceListOutlineView itemAtRow:[_notebookSourceListOutlineView selectedRow]];
    
    if ([sender isKindOfClass:[Section class]]) {
        ((Section *)selectedItem).header = [sender stringValue];
    } else{
        ((Note *)selectedItem).header = [sender stringValue];
    }
}
@end
