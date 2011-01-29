//
//  CMTestViewController.m
//  CMTest
//
//  Created by shuichi on 11/01/28.
//  Copyright 2011 __MyCompanyName__. All rights reserved.
//

#import "CMTestViewController.h"

@implementation CMTestViewController

@synthesize motionManager;


- (void)viewDidLoad {
    [super viewDidLoad];

	// CMMotionManager生成
	CMMotionManager *manager = [[CMMotionManager alloc] init];
	self.motionManager = manager;
	[manager release];

	// ジャイロデータ取得間隔 [sec]
	self.motionManager.gyroUpdateInterval = 0.1;
	
	// ジャイロデータ取得開始
	NSOperationQueue *opQueue = [[[NSOperationQueue alloc] init] autorelease];
	[self.motionManager startGyroUpdatesToQueue:opQueue
									withHandler:^(CMGyroData *data, NSError *error) {
										// ジャイロデータ取得時に実行する処理
										dispatch_async(dispatch_get_main_queue(), ^{
											xLabel.text = [NSString stringWithFormat:@"%f", data.rotationRate.x];
											yLabel.text = [NSString stringWithFormat:@"%f", data.rotationRate.y];
											zLabel.text = [NSString stringWithFormat:@"%f", data.rotationRate.z];
										});
									}];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
	[super viewDidUnload];
}


- (void)dealloc {
	[self.motionManager stopGyroUpdates];
	self.motionManager = nil;
	[xLabel release];
	[yLabel release];
	[zLabel release];
	[super dealloc];
}

@end
