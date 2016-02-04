//
//  Note.h
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Section.h"

@interface Note : NSObject

@property (strong, nonatomic) NSMutableString *header;
@property (copy, nonatomic) NSMutableString *note;

@end
