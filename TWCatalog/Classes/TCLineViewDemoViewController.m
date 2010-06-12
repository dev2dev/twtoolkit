//
//  TCLineViewDemoViewController.m
//  TWCatalog
//
//  Created by Sam Soffes on 4/19/10.
//  Copyright 2010 Tasteful Works, Inc. All rights reserved.
//

#import "TCLineViewDemoViewController.h"
#import <TWToolkit/TWToolkit.h>

@implementation TCLineViewDemoViewController

#pragma mark Class Methods

+ (NSString *)title {
	return @"Line View";
}

#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [[self class] title];
	self.view.backgroundColor = [UIColor groupTableViewBackgroundColor];
	
	TWLineView *lineView1 = [[TWLineView alloc] initWithFrame:CGRectMake(20.0, 20.0, 280.0, 2.0)];
	[self.view addSubview:lineView1];
	[lineView1 release];
	
	TWLineView *lineView2 = [[TWLineView alloc] initWithFrame:CGRectMake(20.0, 42.0, 280.0, 2.0)];
	lineView2.lineColor = [UIColor blueColor];
	[self.view addSubview:lineView2];
	[lineView2 release];
}

@end
