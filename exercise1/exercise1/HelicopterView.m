//
//  HelicopterView.m
//  exercise1
//
//  Created by Jonas Myrlund on 21.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HelicopterView.h"


@implementation HelicopterView

@synthesize view;

- (void)moveWithEvent:(UIEvent *)event {
    // Get one touch event and its point
    UITouch *touch = [[event allTouches] anyObject];
    CGPoint point = [touch locationInView:self.view];
    
    // Get the image bounds
    CGRect bounds = [self frame];
    bounds.origin.x = point.x - dragOffset.x;
    bounds.origin.y = point.y - dragOffset.y;
    
    // Check if outside view horizontally
    if (bounds.origin.x < 0)
        bounds.origin.x = 0;
    else if (bounds.origin.x + bounds.size.width > self.view.bounds.size.width)
        bounds.origin.x = self.view.bounds.size.width - bounds.size.width;
    
    // Check if outside view vertically
    if (bounds.origin.y < 0)
        bounds.origin.y = 0;
    else if (bounds.origin.y + bounds.size.height > self.view.bounds.size.height)
        bounds.origin.y = self.view.bounds.size.height - bounds.size.height;
    
    // Apply bounds
    [self setFrame:bounds];
}

- (IBAction)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event {
    // Store offset
    UITouch *touch = [[event allTouches] anyObject];
    dragOffset = [touch locationInView:self];
    
    [self moveWithEvent:event];
}

- (IBAction)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event {
    [self moveWithEvent:event];
}

@end
