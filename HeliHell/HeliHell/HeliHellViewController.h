//
//  HeliHellViewController.h
//  HeliHell
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Helicopter.h"

@interface HeliHellViewController : UIViewController <UIGestureRecognizerDelegate> {
@private
    NSMutableArray *helicopters;
    NSArray *images;
}

@property(nonatomic, retain) NSArray *helicopters;

- (Helicopter *)generateHelicopter;

@end
