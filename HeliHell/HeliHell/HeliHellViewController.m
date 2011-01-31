//
//  HeliHellViewController.m
//  HeliHell
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "HeliHellViewController.h"

@implementation HeliHellViewController

@synthesize helicopters;

#pragma mark - View lifecycle


// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor colorWithRed:0.976 green:0.098 blue:0.992 alpha:1.0]];
    
    // Load the images
    images = [[NSArray alloc] initWithObjects:
              [UIImage imageNamed:@"heli1.png"],
              [UIImage imageNamed:@"heli2.png"],
              [UIImage imageNamed:@"heli3.png"],
              [UIImage imageNamed:@"heli4.png"], nil];
    
    // Initialize helicopters
    helicopters = [[NSMutableArray alloc] initWithCapacity:10];
    
    // Maek fix timer
    [NSTimer scheduledTimerWithTimeInterval:1.0/30.0 target:self selector:@selector(moveChoppers) userInfo:nil repeats:YES];
    
    // Register for swipes
    UISwipeGestureRecognizer *swipe = [[UISwipeGestureRecognizer alloc] initWithTarget:self action:@selector(swipeFrom:)];
    [self.view addGestureRecognizer:swipe];
    swipe.delegate = self;
    swipe.direction = UISwipeGestureRecognizerDirectionDown;
    swipe.numberOfTouchesRequired = 2;
    [swipe release];
    
    // Register for taps
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapFrom:)];
    [self.view addGestureRecognizer:tap];
    tap.delegate = self;
    [tap release];
}

- (void)swipeFrom:(UISwipeGestureRecognizer *)recognizer {
    for (Helicopter *h in helicopters) {
        [h removeFromSuperview];
    }
    [helicopters removeAllObjects];
}

- (void)tapFrom:(UITapGestureRecognizer *)recognizer {
    // Make helicopter
    CGPoint hitPoint = [recognizer locationInView:self.view];
    
    BOOL hitHelicopter = NO;
    for (Helicopter *h in helicopters) {
        if (CGRectContainsPoint(h.frame, hitPoint)) {
            [helicopters removeObject:h];
            [h removeFromSuperview];
            hitHelicopter = YES;
            break;
        }
    }
    if (!hitHelicopter) {
        Helicopter *h = [self generateHelicopter];
        h.center = hitPoint;
        [helicopters addObject:h];
        [h release];
    }
}

- (Helicopter *)generateHelicopter {
    // Get size
    CGSize size = [[images objectAtIndex:0] size];
    
    // Randomize starting position
    int x = arc4random() % (int)(self.view.frame.size.width-size.width);
    int y = arc4random() % (int)(self.view.frame.size.height-size.height);
    
    // Make the initial frame
    CGRect frame = CGRectMake(x, y, size.width, size.height);
    
    // Make the chopper
    Helicopter *helicopter = [[Helicopter alloc] initWithFrame:frame];
    helicopter.animationImages = images;
    helicopter.animationRepeatCount = 0;
    helicopter.animationDuration = 0.5;
    [helicopter startAnimating];
    
    [self.view addSubview:helicopter];
    
    double directionX = (arc4random() % 10 + 10);
    if (arc4random() % 2 == 0) directionX *= -1;
    
    double directionY = (arc4random() % 10 + 10);
    if (arc4random() % 2 == 0) directionY *= -1;
    
    [helicopter setDirectionX:directionX y:directionY];
    [helicopter setVelocity:(double)(arc4random() % 10 + 5)];
    
    return helicopter;
}

- (void)moveChoppers {
    for (Helicopter *h in helicopters) {
        [h move];
    }
    
    for (int i = 0; i < [helicopters count]; i++) {
        Helicopter *h1 = [helicopters objectAtIndex:i];
        
        for (int j = i + 1; j < [helicopters count]; j++) {
            Helicopter *h2 = [helicopters objectAtIndex:j];
            
            if (CGRectIntersectsRect(h1.frame, h2.frame)) {
                [h1 bumpedBy:h2];
            }
        }
    }
}


- (void)viewDidUnload
{
    [super viewDidUnload];
    [helicopters release];
}

- (void)dealloc {
    [helicopters dealloc];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
