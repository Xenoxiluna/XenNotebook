//
//  OpenNoteTableViewController.m
//  XenNotes
//
//  Created by Quentin Berry on 1/30/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "OpenNoteTableView.h"

@implementation OpenNoteTableView

-(NSInteger)numberOfRowsInTableView:(NSTableView *)tableView{
    return [existingNotebooks count];
}

//-(id)tableView:(NSTableView *)tableView objectValueForTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
//    
//}
//
//-(void)tableView:(NSTableView *)tableView setObjectValue:(id)object forTableColumn:(NSTableColumn *)tableColumn row:(NSInteger)row{
//    
//}

@end
