//
//  EPNewsTimelineCell.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EPNewsTimelineCell : UITableViewCell {
    
}

@property (strong, nonatomic) IBOutlet UIImageView *imgView;

@property (strong, nonatomic) IBOutlet UILabel *dateLabel;

@property (strong, nonatomic) IBOutlet UILabel *titleLabel;

@property (strong, nonatomic) IBOutlet UILabel *descriptionLabel;

@property (strong, nonatomic) IBOutlet NSString *htmlURL;

@property (strong, nonatomic) IBOutlet NSString *objectID;

@end
