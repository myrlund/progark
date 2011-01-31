//
//  Paddle.h
//  Pong
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface Paddle : UIImageView {
@private
    double offset;
}

- (void)setOffset:(double)newOffset;
- (double)offset;

@end
