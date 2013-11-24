//
//  EPNewsDetailViewController.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPNewsDetailViewController.h"

@interface EPNewsDetailViewController ()

@end

@implementation EPNewsDetailViewController

@synthesize titleLabel;
@synthesize dateLabel;
@synthesize imgView;
@synthesize favButton;
@synthesize mailButton;
@synthesize faceBookButton;
@synthesize twitterButton;
@synthesize gplusButton;
@synthesize webView;
@synthesize newsItem;

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
    NSString *title = newsItem.title;
    NSString *date = newsItem.date;
    UIImage *image = newsItem.image;
    NSURL *htmlURL = [NSURL URLWithString:newsItem.htmlURL];
    
    [titleLabel setText:title];
    [dateLabel setText:date];
    [imgView setImage:image];
    
    NSURLRequest *request = [NSURLRequest requestWithURL:htmlURL];
    [webView loadRequest:request];
    
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (IBAction)favArticle:(id)sender {
    NSString *objectID = [newsItem objectID];
    
    PFObject *user = [PFUser currentUser];
    
    if (user) {
        [user addObject:objectID forKey:@"favNews"];
        [user saveInBackground];

    }
    else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Erreur" message:@"Pour accéder à cette rubrique, vous devez être connecté" delegate:self cancelButtonTitle:@"Annuler" otherButtonTitles:@"Me connecter", nil];
        [alert show];
    }
}

- (IBAction)mailTo:(id)sender {
    [[UIApplication sharedApplication] openURL:[NSURL URLWithString:@"mailto:"]];
}

- (IBAction)imageTap:(id)sender {
    
    [self performSegueWithIdentifier:@"zoom" sender:self];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    EPNewsPhotoViewController *destination = segue.destinationViewController;
    
    destination.photo = [imgView image];

}


@end
