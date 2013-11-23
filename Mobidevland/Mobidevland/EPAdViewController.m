//
//  EPAdViewController.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPAdViewController.h"

@interface EPAdViewController () {
    NSDate *currentDate;
    NSTimeInterval *interval;
}

@end

@implementation EPAdViewController {
    NSURL *adURL;
}

@synthesize splashImage;

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
    
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    adURL = [NSURL URLWithString:[prefs stringForKey:@"adURL"]];
    
    NSData *imageData = [NSData dataWithContentsOfURL: adURL];
    UIImage *adImage = [UIImage imageWithData:imageData];
    [splashImage setImage:adImage];
    
    // Do any additional setup after loading the view.
    timer = [NSTimer timerWithTimeInterval:5.0 target:self selector:@selector(timerFireMethod:) userInfo:nil repeats:NO];
    
    [[NSRunLoop mainRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)timerFireMethod:(NSTimer *)timer {
    
    [self performSegueWithIdentifier:@"pubToHome" sender:self];
    
}

@end