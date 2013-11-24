//
//  EPNewsPhotoViewController.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPNewsPhotoViewController : UIViewController

@property (nonatomic, strong) UIImage *photo;

@property (strong, nonatomic) IBOutlet UIImageView *photoView;

- (IBAction)dismiss:(id)sender;

@end
