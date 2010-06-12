//
//  TCPickerDetailViewController.m
//  TWCatalog
//
//  Created by Sam Soffes on 10/9/09.
//  Copyright 2009 Tasteful Works, Inc. All rights reserved.
//

#import "TCPickerDetailViewController.h"
#import "TCPickerDemoViewController.h"

@implementation TCPickerDetailViewController

#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = @"Choose";
}

#pragma mark TWPickerViewController

- (void)loadKeys {
	self.keys = [[NSTimeZone abbreviationDictionary] allKeys];
}


- (NSString *)cellTextForKey:(NSString *)key {
	return  [[NSTimeZone timeZoneWithAbbreviation:key] name];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[super tableView:tableView didSelectRowAtIndexPath:indexPath];

	// Notify the parent view controller of the change
	TCPickerDemoViewController *viewController = (TCPickerDemoViewController *)[self.navigationController.viewControllers objectAtIndex:([self.navigationController.viewControllers count] - 2)];
	viewController.selectedAbbreviation = [self.keys objectAtIndex:indexPath.row];

	[self.navigationController popViewControllerAnimated:YES];
}

@end
