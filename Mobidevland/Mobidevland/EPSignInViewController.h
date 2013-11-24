//
//  EPSignInViewController.h
//  Mobidevland
//
//  Created by Maxime Cattet on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EPSignInViewController : UIViewController {
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
}
- (IBAction)connectionPressed:(id)sender;
- (IBAction)facebookConnection:(id)sender;

@end
