//
//  PongViewController.h
//  Pong
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Paddle.h"
#import "Ball.h"

@interface PongViewController : UIViewController <UIAccelerometerDelegate> {
@private
    unsigned int score;
    
    UIAccelerometer *accelerometer;
    NSMutableArray *latestMeasurements;
    
    IBOutlet Paddle *user;
    
    IBOutlet Ball *ball;
    
    IBOutlet UILabel *accelerometerStatus;
    IBOutlet UILabel *scoreLabel;
}

@property(nonatomic, retain) IBOutlet Paddle *user;
@property(nonatomic, retain) IBOutlet Ball *ball;
@property(nonatomic, retain) IBOutlet UILabel *accelerometerStatus;
@property(nonatomic, retain) IBOutlet UILabel *scoreLabel;

- (void)tick;
- (void)bumpScore;

@end
