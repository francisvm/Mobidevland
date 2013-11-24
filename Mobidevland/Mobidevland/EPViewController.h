//
//  EPViewController.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EPViewController : UIViewController {
    PFUser *currentUser;
    IBOutlet UIButton *accountButton;
}

- (IBAction)buttonPressedToView:(id)sender;

- (IBAction)accountButtonPressed:(id)sender;
- (IBAction)myAccountPressed:(id)sender;
- (IBAction)jobsPressed:(id)sender;
- (IBAction)appelAProjetsPressed:(id)sender;
- (IBAction)favorisPressed:(id)sender;
- (IBAction)chatPressed:(id)sender;
- (IBAction)touchPressed:(id)sender;

- (NSMutableArray *) objectArrayToLinkArray:(NSArray *)objectArray;

@end
