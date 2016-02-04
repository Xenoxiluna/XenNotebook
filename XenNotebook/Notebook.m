//
//  Notebook.m
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "Notebook.h"

@implementation Notebook
- (instancetype)init
{
    self = [super init];
    if (self) {
        _notebookName = [[NSMutableString alloc] initWithString:@"New Notebook"];
        _version = [[NSMutableString alloc] initWithString:@"0.0.1"];
        _notes = [[NSMutableDictionary alloc] init];
    }
    return self;
}

-(void)encodeWithCoder:(NSCoder *)coder{
    [coder encodeObject:_notebookName forKey:@"notebookName"];
    [coder encodeObject:_version forKey:@"version"];
    [coder encodeObject:_notes forKey:@"notes"];
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super init];
    if (self) {
        _notebookName = [coder decodeObjectForKey:@"notebookName"];
        _version = [coder decodeObjectForKey:@"version"];
        _notes = [coder decodeObjectForKey:@"notes"];
    }
    return self;
}

@end
