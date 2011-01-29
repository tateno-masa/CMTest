//
//  CMTestViewController.h
//  CMTest
//
//  Created by shuichi on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreMotion/CoreMotion.h>

@interface CMTestViewController : UIViewController {

	CMMotionManager		*motionManager;

	IBOutlet UILabel	*xLabel;
	IBOutlet UILabel	*yLabel;
	IBOutlet UILabel	*zLabel;
}
@property (nonatomic, retain) CMMotionManager *motionManager;

@end

