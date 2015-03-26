//
//  ViewController.m
//  LockScreenOrientation
//
//  Created by Masakiyo on 2015/03/23.
//  Copyright (c) 2015年 saka. All rights reserved.
//

#import "ViewController.h"
#import "TableViewController.h"
#import "TmpViewController.h"

@interface ViewController ()

@property (nonatomic, weak) TableViewController *tableViewController;

@end

@implementation ViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
	
	self.screenOrientation = ScreenOrientationAuto;
}

- (NSUInteger)supportedInterfaceOrientations {
	if (self.screenOrientation == ScreenOrientationAuto) {
		return UIInterfaceOrientationMaskAll;
	} else if (self.screenOrientation == ScreenOrientationPortrait) {
		return UIInterfaceOrientationMaskPortrait;
	}
	return UIInterfaceOrientationMaskLandscapeRight;
}

- (BOOL)shouldAutorotate {
	return NO;
}

- (void)didReceiveMemoryWarning {
	[super didReceiveMemoryWarning];
	// Dispose of any resources that can be recreated.
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
	NSString * segueName = segue.identifier;
	if ([segueName isEqualToString: @"contents"]) {
		self.tableViewController = (TableViewController *)[segue destinationViewController];
		self.tableViewController.parent = self;
	}
}

- (void)setScreenOrientation:(ScreenOrientation)screenOrientation {
	_screenOrientation = screenOrientation;
	//[UIViewController attemptRotationToDeviceOrientation];
	
	TmpViewController *tmp = [self.storyboard instantiateViewControllerWithIdentifier:@"TmpViewController"];
	[self presentViewController:tmp animated:NO completion:^(void){
		[self dismissViewControllerAnimated:NO completion:nil];
	}];
}

@end
