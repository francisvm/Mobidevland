//
//  EPMyAccountViewController.m
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPMyAccountViewController.h"

@interface EPMyAccountViewController ()

@end

@implementation EPMyAccountViewController

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
    
    PFUser *currentUser = [PFUser currentUser];
    [fullNameLabel setText:[NSString stringWithFormat:@"%@ %@", currentUser[@"prenom"], currentUser[@"nom"]]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)disconnectedPressed:(id)sender {
    [PFUser logOut];
    [self performSegueWithIdentifier:@"SignOut" sender:self];
}
@end
