//
//  Ball.h
//  Pong
//
//  Created by Jonas Myrlund on 29.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>

struct _Direction {
    double x, y;
};
typedef struct _Direction Direction;

@interface Ball : UIImageView {
@private
    Direction direction;
    double velocity;
}

- (void)move;
- (void)setDirectionX:(double)x y:(double)y;
- (void)setVelocity:(double)newVelocity;
- (void)increaseVelocity;
- (void)bumpOnSide:(CGRectEdge)side;

@end
