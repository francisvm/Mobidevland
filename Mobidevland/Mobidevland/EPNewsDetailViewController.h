//
//  EPNewsDetailViewController.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPNewsItem.h"
#import <Parse/Parse.h>
#import "EPNewsPhotoViewController.h"

@interface EPNewsDetailViewController : UIViewController {

}
@property (strong, nonatomic) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UILabel *dateLabel;
@property (strong, nonatomic) IBOutlet UIImageView *imgView;
@property (strong, nonatomic) IBOutlet UIButton *favButton;
@property (strong, nonatomic) IBOutlet UIImageView *mailButton;
@property (strong, nonatomic) IBOutlet UIButton *faceBookButton;
@property (strong, nonatomic) IBOutlet UIButton *twitterButton;
@property (strong, nonatomic) IBOutlet UIButton *gplusButton;
@property (strong, nonatomic) IBOutlet UIWebView *webView;

@property (strong, nonatomic) EPNewsItem *newsItem;

- (IBAction)favArticle:(id)sender;
- (IBAction)mailTo:(id)sender;

- (IBAction)imageTap:(id)sender;


@end
