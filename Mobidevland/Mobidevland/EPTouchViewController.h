//
//  EPTouchViewController.h
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EPTouchViewController : UIViewController {
    IBOutlet UIButton *accountButton;
    IBOutlet UITableView *filterView;
    IBOutlet UITableView *listView;
    PFUser *currentUser;
}
- (IBAction)segmentedControlChanged:(id)sender;

@end
