//
//  Section.h
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Section : NSObject

@property (strong, nonatomic) NSMutableString *header;
//@property (strong, nonatomic) NSMutableDictionary *notes;
@property (strong, nonatomic) NSMutableArray *notes;

@end
