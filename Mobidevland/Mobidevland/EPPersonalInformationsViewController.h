//
//  EPPersonalInformationsViewController.h
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <Parse/Parse.h>

@interface EPPersonalInformationsViewController : UIViewController {
    PFUser *currentUser;
    BOOL isEditable;
    
    IBOutlet UITextField *ville;
    IBOutlet UITextField *cp;
    IBOutlet UITextField *adresse;
    IBOutlet UITextField *email;
    IBOutlet UITextField *nom;
    IBOutlet UITextField *prenom;
    IBOutlet UIButton *changeEditionModeButton;
}
- (IBAction)changeEditionMode:(id)sender;

@end
