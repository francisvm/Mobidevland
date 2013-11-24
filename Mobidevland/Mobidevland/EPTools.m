//
//  EPTools.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 24/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPTools.h"

NSMutableArray *dataArray;

@implementation EPTools

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize
{
    UIGraphicsBeginImageContext( newSize );
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();
    
    return newImage;
}

+ (NSMutableArray *)newsArray {
    return dataArray;
}

+ (void)newsArrayWithArray:(NSMutableArray *)array {
    dataArray = array;
}

+ (void)reloadNewsArray {
    PFQuery *newsQuery = [PFQuery queryWithClassName:@"News"];
    [newsQuery findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            dataArray = [[NSMutableArray alloc] initWithCapacity:[objects count]];
            for (PFObject *obj in objects) {
                [dataArray insertObject:obj atIndex:0];
            }
        } else {
            // Log details of the failure
            NSLog(@"Error: %@ %@", error, [error userInfo]);
        }
    }];
}

@end
