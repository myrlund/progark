//
//  Helicopter.m
//  HeliHell
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Helicopter.h"


@implementation Helicopter

// Set direction vector
- (void)setDirectionX:(double)x y:(double)y {
    // Get angle of vector
    double angle = atan(y/x);
    
    // Get normalized direction
    direction.x = (x / fabs(x)) * fabs(cos(angle));
    direction.y = (y / fabs(y)) * fabs(sin(angle));
    
    // Face the right way
    if (x > 0)
        [self bumped:CGRectMinXEdge];
}

- (double)velocity {
    return velocity;
}

- (void)setVelocity:(double)newVelocity {
    velocity = newVelocity;
}

- (void)move {
    int x = self.center.x + round(direction.x * velocity),
        y = self.center.y + round(direction.y * velocity);
    
    self.center = CGPointMake(x, y);
    
    // Check for wall bumps
    if (self.frame.origin.x <= 0)
        [self bumped:CGRectMinXEdge];
    else if (self.frame.origin.x + self.frame.size.width >= self.superview.frame.size.width)
        [self bumped:CGRectMaxXEdge];
    else if (self.frame.origin.y <= 0)
        [self bumped:CGRectMinYEdge];
    else if (self.frame.origin.y + self.frame.size.height >= self.superview.frame.size.height)
        [self bumped:CGRectMaxYEdge];
}

- (void)bumpedBy:(Helicopter *)other {
    CGRect intersect = CGRectIntersection(self.frame, other.frame);
    
    double deltaX = other.frame.origin.x - self.frame.origin.x,
           deltaY = other.frame.origin.y - self.frame.origin.y;
    
    if (intersect.size.width < intersect.size.height) {
        // Collision to right or left
        if (deltaX > 0) {
            [self bumped:CGRectMaxXEdge];
            [other bumped:CGRectMinXEdge];
        }
        else {
            [self bumped:CGRectMinXEdge];
            [other bumped:CGRectMaxXEdge];
        }
    }
    else {
        // Collision top or bottom
        if (deltaY > 0) {
            [self bumped:CGRectMaxYEdge];
            [other bumped:CGRectMinYEdge];
        }
        else {
            [self bumped:CGRectMinYEdge];
            [other bumped:CGRectMaxYEdge];
        }
    }
    
    // Swap velocities with other for elastic bump
    double v = velocity;
    velocity = [other velocity];
    [other setVelocity:v];
}

- (void)bumped:(CGRectEdge)from {
    if (from == CGRectMaxXEdge) {
        self.transform = CGAffineTransformIdentity;
        direction.x = -fabs(direction.x);
    }
    else if (from == CGRectMinXEdge) {
        self.transform = CGAffineTransformIdentity;
        self.transform = CGAffineTransformMakeScale(-1.0, 1.0);
        direction.x = fabs(direction.x);
    }
    else if (from == CGRectMaxYEdge)
        direction.y = -fabs(direction.y);
    else if (from == CGRectMinYEdge)
        direction.y = fabs(direction.y);
    else
        NSLog(@"Hum, chopper was bumped from nowhere...");
}

@end
