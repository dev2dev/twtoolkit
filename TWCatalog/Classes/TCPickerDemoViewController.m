//
//  TCPickerDemoViewController.m
//  TWCatalog
//
//  Created by Sam Soffes on 10/9/09.
//  Copyright 2009 Tasteful Works, Inc. All rights reserved.
//

#import "TCPickerDemoViewController.h"
#import "TCPickerDetailViewController.h"

@implementation TCPickerDemoViewController

@synthesize selectedAbbreviation;

#pragma mark Class Methods

+ (NSString *)title {
	return @"Settings Picker";
}

#pragma mark NSObject

- (id)init {
	self = [super initWithStyle:UITableViewStyleGrouped];
    return self;
}


- (void)dealloc {
	[selectedAbbreviation release];
	[super dealloc];
}

#pragma mark UIViewController

- (void)viewDidLoad {
	[super viewDidLoad];
	self.title = [[self class] title];
	self.selectedAbbreviation = [[NSTimeZone defaultTimeZone] abbreviation];
}


- (void)viewWillAppear:(BOOL)animated {
	[super viewWillAppear:animated];
	[self.tableView reloadData];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
	return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
	return 1;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellIdentifier = @"cell";

	UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
	if (cell == nil) {
		cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:cellIdentifier] autorelease];
	}

	cell.textLabel.text = @"Picker Value";
	cell.detailTextLabel.text = [[NSTimeZone timeZoneWithAbbreviation:self.selectedAbbreviation] name];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;

	return cell;
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	TCPickerDetailViewController *viewController = [[TCPickerDetailViewController alloc] initWithStyle:UITableViewStyleGrouped];
	viewController.selectedKey = self.selectedAbbreviation;
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];
}

@end
