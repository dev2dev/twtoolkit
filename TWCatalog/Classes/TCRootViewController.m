//
//  TCRootViewController.m
//  TWCatalog
//
//  Created by Sam Soffes on 10/9/09.
//  Copyright 2009 Tasteful Works, Inc. All rights reserved.
//

#import "TCRootViewController.h"
#import "TCPickerDemoViewController.h"
#import "TCGradientViewDemoViewController.h"

#define kTitleKey @"title"
#define kClassesKey @"classes"

@interface UIViewController (TCRootViewControllerAdditions)
+ (id)setup;
@end

@implementation TCRootViewController

#pragma mark NSObject

- (void)dealloc {
	[data release];
	[super dealloc];
}

#pragma mark UIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
	
	self.title = @"TWCatalog";

    data = [[NSArray alloc] initWithObjects:
			[NSDictionary dictionaryWithObjectsAndKeys:
			 [NSArray arrayWithObjects:
              @"TCCollectionViewDemoViewController",
			  @"TCGradientViewDemoViewController",
			  @"TCHUDViewDemoViewController",
			  @"TCLineViewDemoViewController",
			  @"TCPieProgressViewDemoViewController",
			  nil],
			 kClassesKey,
			 @"Views",
			 kTitleKey,
			 nil],
			[NSDictionary dictionaryWithObjectsAndKeys:
			 [NSArray arrayWithObjects:
			  @"TCPickerDemoViewController",
			  @"TCMessagesDemoViewController",
			  nil],
			 kClassesKey,
			 @"View Controllers",
			 kTitleKey,
			 nil],
			nil];
}

#pragma mark UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return [data count];
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [[[data objectAtIndex:section] objectForKey:kClassesKey] count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    static NSString *cellIdentifier = @"cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier] autorelease];
    }
	
	Class klass = [[NSBundle mainBundle] classNamed:[[[data objectAtIndex:indexPath.section] objectForKey:kClassesKey] objectAtIndex:indexPath.row]];
		
	cell.textLabel.text = [klass title];
//	cell.detailTextLabel.text = [row objectForKey:kDescriptionKey];
	cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
	
    return cell;
}


- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
	return [[data objectAtIndex:section] objectForKey:kTitleKey];
}

#pragma mark UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
	[self.tableView deselectRowAtIndexPath:indexPath animated:YES];
	
	Class klass = [[NSBundle mainBundle] classNamed:[[[data objectAtIndex:indexPath.section] objectForKey:kClassesKey] objectAtIndex:indexPath.row]];
	UIViewController *viewController = [[klass alloc] init];
	[self.navigationController pushViewController:viewController animated:YES];
	[viewController release];
}

@end
