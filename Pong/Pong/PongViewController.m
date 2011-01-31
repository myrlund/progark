//
//  PongViewController.m
//  Pong
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "PongViewController.h"

@implementation PongViewController

@synthesize user, accelerometerStatus, ball, scoreLabel;

const unsigned int avg_n = 3;

// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    accelerometer = [UIAccelerometer sharedAccelerometer];
    accelerometer.updateInterval = .05;
    accelerometer.delegate = self;
    
    score = 0;
    latestMeasurements = [[NSMutableArray alloc] initWithCapacity:avg_n];
    
    [ball setDirectionX:1.0 y:1.0];
    [ball setVelocity:5.0];
    
    [NSTimer scheduledTimerWithTimeInterval:1.0/60.0 target:self selector:@selector(tick) userInfo:nil repeats:YES];
}

- (void)tick {
    [ball move];
    
    // Check for paddle collision
    if (CGRectIntersectsRect(ball.frame, user.frame)) {
        CGRect intersect = CGRectIntersection(ball.frame, user.frame);
        
        if (intersect.size.width < intersect.size.height) {
            [ball bumpOnSide:CGRectMaxXEdge];
            [self bumpScore];
        }
        else {
            [ball bumpOnSide:CGRectMaxYEdge];
            [self bumpScore];
        }
    }
}

- (void)bumpScore {
    [ball increaseVelocity];
    
    score++;
    scoreLabel.text = [NSString stringWithFormat:@"%d", score];
}

- (void)accelerometer:(UIAccelerometer *)accelerometer didAccelerate:(UIAcceleration *)acceleration {
    accelerometerStatus.text = [NSString stringWithFormat: @"X: %f\nY: %f", acceleration.x, acceleration.y];
    
    // Pop element if enough
    if ([latestMeasurements count] > avg_n) {
        [latestMeasurements removeObjectAtIndex:0];
    }
    [latestMeasurements addObject:acceleration];
    
    double sum = 0.0;
    for (UIAcceleration *a in latestMeasurements)
        sum += a.x;
    double offset = (sum / [latestMeasurements count]) * (self.view.frame.size.width / 2.0);
    [user setOffset:offset];
}

- (void)dealloc
{
    [user dealloc];
    [ball dealloc];
    [accelerometerStatus dealloc];
    [accelerometer release];
    [latestMeasurements dealloc];
    [super dealloc];
}

#pragma mark - View lifecycle

- (void)viewDidUnload
{
    [super viewDidUnload];
    // Release any retained subviews of the main view.
    // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
