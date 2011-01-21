//
//  exercise1AppDelegate.h
//  exercise1
//
//  Created by Jonas Myrlund on 21.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@class exercise1ViewController;

@interface exercise1AppDelegate : NSObject <UIApplicationDelegate> {
@private

}

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet exercise1ViewController *viewController;

@end
