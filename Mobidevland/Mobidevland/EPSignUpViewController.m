//
//  EPSignUpViewController.m
//  Mobidevland
//
//  Created by Maxime Cattet on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#define kOFFSET_FOR_KEYBOARD 100.0
#import "EPSignUpViewController.h"

@interface EPSignUpViewController ()

@end

@implementation EPSignUpViewController

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
	checkBoxSelected = NO;
    [self registerForKeyboardNotifications];
    UITapGestureRecognizer *singleTap = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(singleTapGestureCaptured:)];
    [self.view addGestureRecognizer:singleTap];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)checkOrUncheckCGU:(id)sender {
    if (!checkBoxSelected) {
        checkBoxSelected = YES;
        [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"FieldOn"] forState:UIControlStateNormal];
    }
    else {
        checkBoxSelected = NO;
        [checkBoxButton setBackgroundImage:[UIImage imageNamed:@"FieldOff"] forState:UIControlStateNormal];
    }
}

- (IBAction)signUpPressed:(id)sender {
    NSString *errorMsg = nil;
    if (![self validateEmail:email.text])
        errorMsg = @"Votre adresse e-mail n'est pas valide";
    else if (![password.text isEqualToString:confirmationPassword.text])
        errorMsg = @"Vos mots de passe ne correspondent pas";
    else if (!checkBoxSelected)
        errorMsg = @"Vous n'avez pas accepter les conditions générales d'utilisation";
        
    if (errorMsg != nil){
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:errorMsg delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"Ok", nil];
        [alert show];
    }
    else{
        NSLog(@"right :)");
        PFUser *user = [PFUser user];
        user.username = email.text;
        user[@"nom"] = nom.text;
        user[@"prenom"] = prenom.text;
        user.email = email.text;
        user.password = password.text;
        [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
            if (!error) {
                NSLog(@"Sign up successfull");
                [PFUser logInWithUsernameInBackground:user.username password:user.password
                                                block:^(PFUser *user, NSError *error) {
                                                    if (user) {
                                                        [self performSegueWithIdentifier:@"SignUpDone" sender:self];
                                                    } else {
                                                        // The login failed. Check error to see why.
                                                    }
                                                }];
            }
            else {
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:[error userInfo][@"error"] delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"Ok", nil];
                [alert show];
            }
        }];
    }
}

- (IBAction)facebookSignUpPressed:(id)sender {
    // The permissions requested from the user
    NSArray *permissionsArray = @[ @"user_about_me", @"user_relationships", @"user_birthday", @"user_location"];
    
    // Login PFUser using Facebook
    [PFFacebookUtils logInWithPermissions:permissionsArray block:^(PFUser *user, NSError *error) {
        if (!user) {
            if (!error) {
                NSLog(@"Uh oh. The user cancelled the Facebook login.");
            } else {
                NSLog(@"Uh oh. An error occurred: %@", error);
            }
        } else if (user.isNew) {
            NSLog(@"User with facebook signed up and logged in!");
            [self facebookDataOnPFUser:user];
            [self performSegueWithIdentifier:@"SignUpDone" sender:self];
        } else {
            NSLog(@"User with facebook logged in!");
            [self performSegueWithIdentifier:@"SignUpDone" sender:self];
        }
    }];
}

- (void)facebookDataOnPFUser:(PFUser*)user{
    FBRequest *request = [FBRequest requestForMe];
    
    [request startWithCompletionHandler:^(FBRequestConnection *connection, id result, NSError *error) {
        if (!error) {
            NSDictionary *userData = (NSDictionary *)result;
            
            user[@"nom"] = userData[@"last_name"];
            user[@"prenom"] = userData[@"first_name"];
            user.email = userData[@"email"];
            user.username = userData[@"email"];
        }
    }];
}

- (void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex {
    if (buttonIndex == 0) {
        NSLog(@"Cancel Tapped.");
    }
    else if (buttonIndex == 1) {
        NSLog(@"OK Tapped. Hello World!");
    }
}

- (BOOL) validateEmail: (NSString *) candidate {
    NSString *emailRegex = @"[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,6}";
    NSPredicate *emailTest = [NSPredicate predicateWithFormat:@"SELF MATCHES %@", emailRegex];
    
    return [emailTest evaluateWithObject:candidate];
}

- (void)registerForKeyboardNotifications

{
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

-(void)keyboardWillShow {
    // Animate the current view out of the way
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

- (void)singleTapGestureCaptured:(UITapGestureRecognizer *)gesture
{
    //Get touch point
    CGPoint touchPoint=[gesture locationInView:self.view];
    
    //Hide keyBoard
    [self.view endEditing:YES];
}

-(void)keyboardWillHide {
    if (self.view.frame.origin.y >= 0)
    {
        [self setViewMovedUp:YES];
    }
    else if (self.view.frame.origin.y < 0)
    {
        [self setViewMovedUp:NO];
    }
}

-(void)textFieldDidBeginEditing:(UITextField *)sender
{
    if ([sender isEqual:password] || [sender isEqual:confirmationPassword])
    {
        //move the main view, so that the keyboard does not hide it.
        if  (self.view.frame.origin.y >= 0)
        {
            [self setViewMovedUp:YES];
        }
    }
}

-(void)setViewMovedUp:(BOOL)movedUp
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.3]; // if you want to slide up the view
    
    CGRect rect = self.view.frame;
    if (movedUp)
    {
        // 1. move the view's origin up so that the text field that will be hidden come above the keyboard
        // 2. increase the size of the view so that the area behind the keyboard is covered up.
        rect.origin.y -= kOFFSET_FOR_KEYBOARD;
        rect.size.height += kOFFSET_FOR_KEYBOARD;
    }
    else
    {
        // revert back to the normal state.
        rect.origin.y += kOFFSET_FOR_KEYBOARD;
        rect.size.height -= kOFFSET_FOR_KEYBOARD;
    }
    self.view.frame = rect;
    
    [UIView commitAnimations];
}
@end
