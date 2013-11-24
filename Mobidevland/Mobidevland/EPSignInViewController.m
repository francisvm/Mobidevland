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
@end
