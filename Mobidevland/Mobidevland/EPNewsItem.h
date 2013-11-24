//
//  EPNewsItem.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EPNewsItem : NSObject {
    
}

@property (nonatomic, strong) NSString *date;
@property (nonatomic, strong) NSString *title;
@property (nonatomic, strong) UIImage *image;
@property (nonatomic, strong) NSString *htmlURL;
@property (nonatomic, strong) NSString *objectID;

- (id) initWithDate:(NSString *)date title:(NSString *)title image:(UIImage *)image htmlURL:(NSString *)htmlURL objectID:(NSString *)objectID;

@end
