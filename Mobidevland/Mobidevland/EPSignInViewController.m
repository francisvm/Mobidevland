//
//  EPSignInViewController.m
//  Mobidevland
//
//  Created by Maxime Cattet on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPSignInViewController.h"

@interface EPSignInViewController ()

@end

@implementation EPSignInViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)connectionPressed:(id)sender {
    [PFUser logInWithUsernameInBackground:email.text password:password.text
                                    block:^(PFUser *user, NSError *error) {
                                        if (user) {
                                            [self performSegueWithIdentifier:@"SignInDone" sender:self];
                                        } else {
                                            // The login failed. Check error to see why.
                                        }
                                    }];
}

- (IBAction)facebookConnection:(id)sender {
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            [self performSegueWithIdentifier:@"SignInDone" sender:self];
        } else {
            NSLog(@"User with facebook logged in!");
            [self performSegueWithIdentifier:@"SignInDone" sender:self];
        }
    }];
}
@end
