//
//  Helicopter.h
//  HeliHell
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct _Direction {
    double x, y;
};
typedef struct _Direction Direction;

@interface Helicopter : UIImageView {
    double velocity;
@private
    Direction direction;
}

- (void)move;
- (void)bumped:(CGRectEdge)from;
- (void)bumpedBy:(Helicopter *)other;
- (void)setDirectionX:(double)x y:(double)y;

- (double)velocity;
- (void)setVelocity:(double)newVelocity;

@end
