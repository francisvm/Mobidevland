//
//  EPMyAccountViewController.h
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EPMyAccountViewController : UIViewController {
    
    IBOutlet UIButton *disconnectButton;
    IBOutlet UILabel *fullNameLabel;
}
- (IBAction)disconnectedPressed:(id)sender;

@end
