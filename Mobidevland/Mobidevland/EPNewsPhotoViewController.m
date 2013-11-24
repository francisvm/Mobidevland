//
//  EPNewsPhotoViewController.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPNewsPhotoViewController.h"

@interface EPNewsPhotoViewController ()

@end

@implementation EPNewsPhotoViewController

@synthesize photoView;

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
    [photoView setImage:self.photo];
    [super viewDidLoad];
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)dismiss:(id)sender {
    [[self navigationController] popViewControllerAnimated:YES];
}
@end
