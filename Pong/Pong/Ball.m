//
//  Ball.m
//  Pong
//
//  Created by Jonas Myrlund on 29.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "Ball.h"


@implementation Ball

- (void)move {
    self.center = CGPointMake(self.center.x + direction.x * velocity, self.center.y + direction.y * velocity);
    
    if (self.frame.origin.x <= 0)
        direction.x = fabs(direction.x);
    else if (self.frame.origin.x + self.frame.size.width >= self.superview.frame.size.width)
        direction.x = -fabs(direction.x);
    
    if (self.frame.origin.y <= 0)
        direction.y = fabs(direction.y);
    else if (self.frame.origin.y + self.frame.size.height >= self.superview.frame.size.height)
        direction.y = -fabs(direction.y);
}

- (void)bumpOnSide:(CGRectEdge)side {
    if (side == CGRectMaxXEdge || side == CGRectMinXEdge) {
        if (direction.x > 0) // Moving right
            direction.x = -fabs(direction.x);
        else // Moving left
            direction.x = fabs(direction.x);
    }
    else {
        if (direction.y > 0) // Moving upwards
            direction.y = -fabs(direction.y);
        else
            direction.y = fabs(direction.y);
    }
}

// Set and normalize direction
- (void)setDirectionX:(double)x y:(double)y {
    double angle = atan(y/x);
    direction.x = cos(angle);
    direction.y = sin(angle);
}

- (void)increaseVelocity {
    if (velocity < 10.0)
        velocity += .2;
}

- (void)setVelocity:(double)newVelocity {
    velocity = newVelocity;
}

@end
