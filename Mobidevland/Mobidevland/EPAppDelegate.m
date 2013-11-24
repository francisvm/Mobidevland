//
//  EPAppDelegate.m
//  Mobidevland
//
//  Created by Francis Visoiu Mistrih on 23/11/2013.
//  Copyright (c) 2013 EpiPortal. All rights reserved.
//

#import "EPAppDelegate.h"

@implementation EPAppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    // Override point for customization after application launch.

    //connect to Parse.com
    [Parse setApplicationId:@"BDsbBoyQR66qheRMpQFWPbW3Kg69Huvc7UAGhGzV" clientKey:@"Z8Qrl4qDXVO8NsYGojitQrJ3WAYMZ4HIjwuyo3c8"];
    //add analytics
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    
    [PFFacebookUtils initializeFacebook];
    
    PFQuery *query = [PFQuery queryWithClassName:@"ImageURL"];
    [query whereKey:@"url" notEqualTo:@" "];
    [query getFirstObjectInBackgroundWithBlock:^(PFObject *object, NSError *error) {
        if (!object) {
            NSLog(@"The getFirstObject request failed.");
        } else {
            // The find succeeded.
            [self addURLToPrefsWithID:[object objectId]];
        }
    }];
    [EPTools reloadNewsArray];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application
{
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

- (void)addURLToPrefsWithID:(NSString *)objectId {
    PFQuery *query = [PFQuery queryWithClassName:@"ImageURL"];
    [query getObjectInBackgroundWithId:objectId block:^(PFObject *imageURL, NSError *error) {
        // Do something with the returned PFObject in the gameScore variable.
        NSURL *adURL = [NSURL URLWithString:imageURL[@"url"]];
        
        //check for screen resolutions
        if ([UIScreen instancesRespondToSelector:@selector(scale)])
        {
            CGFloat scale = [[UIScreen mainScreen] scale];
            
            if (scale > 1.0)
            {
                if([[ UIScreen mainScreen ] bounds ].size.height == 568)
                {
                    adURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@-568h@2x.png", [adURL absoluteString]]];
                }
                else
                {
                    adURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@@2x.png", [adURL absoluteString]]];
                }
            }
            else
            {
                adURL = [NSURL URLWithString:[NSString stringWithFormat:@"%@.png", [adURL absoluteString]]];
            }
        }
        
        NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
        [prefs setObject:[adURL absoluteString] forKey:@"adURL"];
        [prefs synchronize];
    }];
}

- (BOOL)application:(UIApplication *)application handleOpenURL:(NSURL *)url {
    return [PFFacebookUtils handleOpenURL:url];
}

- (BOOL)application:(UIApplication *)application openURL:(NSURL *)url
  sourceApplication:(NSString *)sourceApplication annotation:(id)annotation {
    return [PFFacebookUtils handleOpenURL:url];
}

@end
