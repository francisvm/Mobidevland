//
//  EPTouchViewController.m
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPTouchViewController.h"

@interface EPTouchViewController ()

@end

@implementation EPTouchViewController

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
	currentUser = [PFUser currentUser];
}

- (void)viewDidAppear:(BOOL)animated{
    currentUser = [PFUser currentUser];
    if (currentUser){
        [accountButton setTitle:@"Mon Compte" forState:UIControlStateNormal];
        [accountButton setImage:[UIImage imageNamed:@"LedOn"] forState:UIControlStateNormal];
    }
    else {
        [accountButton setTitle:@"Se Connecter" forState:UIControlStateNormal];
        [accountButton setImage:[UIImage imageNamed:@"LedOff"] forState:UIControlStateNormal];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)segmentedControlChanged:(UISegmentedControl*)sender {
    if (sender.selectedSegmentIndex == 0){
        filterView.frame = CGRectMake(0, 130, 320, 438);
        listView.frame = CGRectMake(320, 130, 320, 438);
    }
    if (sender.selectedSegmentIndex == 1){
        filterView.frame = CGRectMake(-320, 130, 320, 438);
        listView.frame = CGRectMake(0, 130, 320, 438);
    }
}
@end
