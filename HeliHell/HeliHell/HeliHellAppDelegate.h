//
//  HeliHellAppDelegate.h
//  HeliHell
//
//  Created by Jonas Myrlund on 28.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class HeliHellViewController;

@interface HeliHellAppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet HeliHellViewController *viewController;

@end
