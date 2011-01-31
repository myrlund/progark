//
//  HelicopterView.h
//  exercise1
//
//  Created by Jonas Myrlund on 21.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface HelicopterView : UIImageView {
@private
    UIView *view;
    
    // Movement
    CGPoint direction;
    float velocity;
    
    CGPoint dragOffset;
    
}

@property(nonatomic, retain) IBOutlet UIView *view;

- (void)handleRotation:(UIGestureRecognizer *)sender;
- (void)move;
- (void)bump:(CGRectEdge)atEdge;

@end
