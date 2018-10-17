//
//  SampleTableViewController.m
//  ObjCSample
//
//

#import "SampleTableViewController.h"

// We chose to create a table view controller that can open another view controller which will contain
// the BlipparSDKView to demonstrate initialising and shutting down the BlipparSDKViewController subclass.

@interface SampleTableViewController ()

@end

@implementation SampleTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // This will stop empty table view cells being display at the end of the table.
    self.tableView.tableFooterView = [[UIView alloc] initWithFrame:CGRectZero];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    // For this example we will have one section only.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    // For this example we will have one row only.
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    // The cell in the Storyboard must have this identifier.
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"ShowBlippsCell" forIndexPath:indexPath];
    
    // A simple cell with a label.
    cell.textLabel.text = @"Start Blipping";
    
    return cell;
}

@end
