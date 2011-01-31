//
//  exercise1ViewController.h
//  exercise1
//
//  Created by Jonas Myrlund on 21.01.11.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "HelicopterView.h"

@interface exercise1ViewController : UIViewController {
@private
    HelicopterView *heli1;
}

@property(nonatomic, retain) IBOutlet HelicopterView *heli1;

@end
