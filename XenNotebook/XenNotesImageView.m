//
//  XenNotesImageView.m
//  XenNotes
//
//  Created by Quentin Berry on 1/30/16.
//  Copyright © 2016 Quentin Berry. All rights reserved.
//

#import "XenNotesImageView.h"

@implementation XenNotesImageView

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Text Drawing
    NSRect textRect = NSMakeRect(0, 0, 324, 63);
    {
        NSString* textContent = @"XenNotebook";
        NSMutableParagraphStyle* textStyle = NSMutableParagraphStyle.defaultParagraphStyle.mutableCopy;
        textStyle.alignment = NSCenterTextAlignment;
        
        NSDictionary* textFontAttributes = @{NSFontAttributeName: [NSFont fontWithName: @"Chalkduster" size: 22], NSForegroundColorAttributeName: NSColor.darkGrayColor, NSParagraphStyleAttributeName: textStyle};
        
        CGFloat textTextHeight = NSHeight([textContent boundingRectWithSize: textRect.size options: NSStringDrawingUsesLineFragmentOrigin attributes: textFontAttributes]);
        NSRect textTextRect = NSMakeRect(NSMinX(textRect), NSMinY(textRect) + (NSHeight(textRect) - textTextHeight) / 2, NSWidth(textRect), textTextHeight);
        [NSGraphicsContext saveGraphicsState];
        NSRectClip(textRect);
        [textContent drawInRect: NSOffsetRect(textTextRect, 0, 0) withAttributes: textFontAttributes];
        [NSGraphicsContext restoreGraphicsState];
    }
}

@end
