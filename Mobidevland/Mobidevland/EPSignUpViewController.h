//
//  EPSignUpViewController.h
//  Mobidevland
//
//  Created by Maxime Cattet on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EPSignUpViewController : UIViewController {
    BOOL checkBoxSelected;
    IBOutlet UIButton *checkBoxButton;
    
    IBOutlet UITextField *prenom;
    IBOutlet UITextField *nom;
    IBOutlet UITextField *email;
    IBOutlet UITextField *password;
    IBOutlet UITextField *confirmationPassword;
}
- (IBAction)checkOrUncheckCGU:(id)sender;
- (IBAction)signUpPressed:(id)sender;
- (IBAction)facebookSignUpPressed:(id)sender;
@end
