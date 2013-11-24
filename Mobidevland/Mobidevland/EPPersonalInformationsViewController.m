//
//  EPPersonalInformationsViewController.m
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPPersonalInformationsViewController.h"

@interface EPPersonalInformationsViewController ()

@end

@implementation EPPersonalInformationsViewController

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
    isEditable = NO;
    [changeEditionModeButton setTitle:@"Modifiez" forState:UIControlStateNormal];
    
	currentUser = [PFUser currentUser];
    [prenom setText:currentUser[@"prenom"]];
    [nom setText:currentUser[@"nom"]];
    [email setText:currentUser[@"email"]];
    
    if (currentUser[@"adresse"])
        [adresse setText:currentUser[@"adresse"]];
    if (currentUser[@"cp"])
        [cp setText:currentUser[@"cp"]];
    if (currentUser[@"ville"])
        [ville setText:currentUser[@"ville"]];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)changeEditionMode:(id)sender {
    if (!isEditable) {
        [changeEditionModeButton setTitle:@"Enregistrez" forState:UIControlStateNormal];
        isEditable = YES;
        [prenom setEnabled:YES];
        [nom setEnabled:YES];
        [email setEnabled:YES];
        [adresse setEnabled:YES];
        [cp setEnabled:YES];
        [ville setEnabled:YES];
    }
    else {
        [changeEditionModeButton setTitle:@"Modifiez" forState:UIControlStateNormal];
        isEditable = NO;
        [prenom setEnabled:NO];
        [nom setEnabled:NO];
        [email setEnabled:NO];
        [adresse setEnabled:NO];
        [cp setEnabled:NO];
        [ville setEnabled:NO];
        
        currentUser.email = email.text;
        currentUser[@"nom"] = nom.text;
        currentUser[@"prenom"] = prenom.text;
        currentUser[@"adresse"] = adresse.text;
        currentUser[@"cp"] = cp.text;
        currentUser[@"ville"] = ville.text;
        if ([currentUser save]) {
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Bravo !" message:@"Vos modifications ont bien été prises en compte" delegate:self cancelButtonTitle:nil otherButtonTitles:@"Ok", nil];
            [alert show];
        }
    }
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
    else if (buttonIndex == 1) {
        NSLog(@"OK Tapped. Hello World!");
    }
}

@end
