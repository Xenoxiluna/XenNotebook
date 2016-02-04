//
//  Notebook.h
//  XenNotes
//
//  Created by Quentin Berry on 1/31/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Notebook : NSObject <NSCoding>

@property (strong, nonatomic) NSMutableString *notebookName;
@property (strong) NSMutableString *version;
@property (strong, nonatomic) NSMutableDictionary *notes;

@end
