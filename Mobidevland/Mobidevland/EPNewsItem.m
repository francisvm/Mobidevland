//
//  EPNewsItem.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPNewsItem.h"

@implementation EPNewsItem

- (id) initWithDate:(NSString *)date title:(NSString *)title image:(UIImage *)image htmlURL:(NSString *)htmlURL objectID:(NSString *)objectID {
    
    self.date = date;
    self.title = title;
    self.image = image;
    self.htmlURL = htmlURL;
    self.objectID = objectID;
    
    return self;
}

@end
