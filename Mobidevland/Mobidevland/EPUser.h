//
//  EPUser.h
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface EPUser : NSObject

@property (strong, nonatomic) PFUser *currentUser;

+ (EPUser*)shared;

@end
