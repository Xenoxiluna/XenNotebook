//
//  Section.m
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "Section.h"

@implementation Section

- (instancetype)init
{
    self = [super init];
    if (self) {
        _header = [[NSMutableString alloc] initWithString:@"New Header!"];
        //_notes = [[NSMutableDictionary alloc] init];
        _notes = [[NSMutableArray alloc] init];
    }
    return self;
}
@end
