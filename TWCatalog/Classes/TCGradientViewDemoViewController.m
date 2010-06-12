//
//  TCGradientViewDemoViewController.m
//  TWCatalog
//
//  Created by Sam Soffes on 10/27/09.
//  Copyright 2009 Tasteful Works, Inc. All rights reserved.
//

#import "TCGradientViewDemoViewController.h"
#import "TWToolkit/TWGradientView.h"

@implementation TCGradientViewDemoViewController

#pragma mark Class Methods

+ (NSString *)title {
	return @"Gradient View";
}

#pragma mark NSObject

- (void)dealloc {
	[gradientView release];
	[super dealloc];
}

#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [[self class] title];
	self.view.backgroundColor = [UIColor whiteColor];
	
	// Gradient view
	gradientView = [[TWGradientView alloc] initWithFrame:CGRectMake(20.0, 20.0, 280.0, 280.0)];
	[self.view addSubview:gradientView];
	
	UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
	button.frame = CGRectMake(20.0, 320.0, 280.0, 37.0);
	[button setTitle:@"Change Color" forState:UIControlStateNormal];
	[button addTarget:self action:@selector(changeColor:) forControlEvents:UIControlEventTouchUpInside];
	[self.view addSubview:button];
	
}

#pragma mark Actions

- (void)changeColor:(id)sender {
	if ([gradientView.topColor isEqual:[TWGradientView defaultTopColor]]) {
		gradientView.topColor = [UIColor whiteColor];
		gradientView.bottomColor = [UIColor grayColor];
	} else {
		gradientView.topColor = [TWGradientView defaultTopColor];
		gradientView.bottomColor = [TWGradientView defaultBottomColor];
	}	
}

@end
