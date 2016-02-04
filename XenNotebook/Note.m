//
//  Note.m
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "Note.h"

@implementation Note

- (instancetype)init
{
    self = [super init];
    if (self) {
        _header = [[NSMutableString alloc] initWithString:@"New Note Header"];
        _note = [[NSMutableString alloc] initWithString:@"New Note!"];
    }
    return self;
}
@end
