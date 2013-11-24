//
//  EPNewsTimelineViewController.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "EPNewsTimelineCell.h"
#import "iCarousel.h"
#import "EPTools.h"
#import <Parse/Parse.h>
#import "EPNewsItem.h"
#import "EPNewsDetailViewController.h"

@interface EPNewsTimelineViewController : UIViewController <UITableViewDataSource,UITableViewDelegate,iCarouselDataSource, iCarouselDelegate>

@property (strong, nonatomic) IBOutlet UITableView *newsTableView;

@property (strong, nonatomic) IBOutlet iCarousel *carousel;

@end
