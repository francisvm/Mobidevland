//
//  EPUser.m
//  Mobidevland
//
//  Created by Maxime Cattet on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPUser.h"
#import <Parse/Parse.h>

@implementation EPUser

static EPUser *sharedEPUser = nil;

+ (EPUser*)shared{
    if (sharedEPUser == nil)
        sharedEPUser = [[super allocWithZone:NULL] init];
    return sharedEPUser;
}

@end
