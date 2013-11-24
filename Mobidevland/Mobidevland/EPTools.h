//
//  EPTools.h
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>

@interface EPTools : NSObject

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize;

+ (NSMutableArray *)newsArray;

+ (void)newsArrayWithArray:(NSMutableArray *)array;

+ (void)reloadNewsArray;

@end
