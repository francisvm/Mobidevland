//
//  EPViewController.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPViewController.h"

@interface EPViewController ()

@end

@implementation EPViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidAppear:(BOOL)animated{
    currentUser = [PFUser currentUser];
    if (currentUser){
        [accountButton setTitle:@"Mon Compte" forState:UIControlStateNormal];
    }
    else {
        [accountButton setTitle:@"Se Connecter" forState:UIControlStateNormal];
    }
}

- (BOOL)isConnectedAlert{
    if (currentUser)
        return true;
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Pour accéder à cette rubrique, vous devez être connecté" delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"Me connecter", nil];
        [alert show];
        return false;
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
    else if (buttonIndex == 1) {
        NSLog(@"Ok Tapped");
        [self performSegueWithIdentifier:@"GoToSignIn" sender:self];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)accountButtonPressed:(id)sender {
    if (currentUser)
        [self performSegueWithIdentifier:@"MyAccount" sender:self];
    else
        [self performSegueWithIdentifier:@"GoToSignIn" sender:self];
}

- (IBAction)myAccountPressed:(id)sender {
    if (currentUser)
        [self performSegueWithIdentifier:@"MyAccount" sender:self];
    else
        [self performSegueWithIdentifier:@"GoToSignIn" sender:self];
}

- (IBAction)jobsPressed:(id)sender {
    if ([self isConnectedAlert])
        [self performSegueWithIdentifier:@"Jobs" sender:self];
}

- (IBAction)appelAProjetsPressed:(id)sender {
    if ([self isConnectedAlert])
        [self performSegueWithIdentifier:@"AppelAProjets" sender:self];
}

- (IBAction)favorisPressed:(id)sender {
    if ([self isConnectedAlert])
        [self performSegueWithIdentifier:@"Favoris" sender:self];
}

- (IBAction)chatPressed:(id)sender {
    if ([self isConnectedAlert])
        [self performSegueWithIdentifier:@"Chat" sender:self];
}
@end
