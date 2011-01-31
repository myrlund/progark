//
//  Paddle.m
//  Pong
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Paddle.h"


@implementation Paddle

- (void)setOffset:(double)newOffset {
    offset = newOffset;
    
    // Calculate effective distance from screen center and apply offset
    double center = self.superview.frame.size.width / 2;
    self.center = CGPointMake(center + offset, self.center.y);
    
    // Move inside screen if not
    CGRect frame = self.frame;
    if (self.frame.origin.x < 0)
        frame.origin.x = 0;
    else if (self.frame.origin.x + self.frame.size.width > self.superview.frame.size.width)
        frame.origin.x = self.superview.frame.size.width - self.frame.size.width;
    self.frame = frame;
}

- (double)offset {
    return offset;
}

@end
