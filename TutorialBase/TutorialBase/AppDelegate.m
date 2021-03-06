//
//  AppDelegate.m
//  TutorialBase
//
//  Created by Antonio MG on 7/13/12.
//  Copyright (c) 2012 __MyCompanyName__. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>

@implementation AppDelegate

@synthesize window = _window;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [Parse setApplicationId:@"JBwWcL56y8D1Z91dtExHWEIIe1TATErLalzIZ77J"
                  clientKey:@"9UIvBdajqaIibxptHCPKTyUHk9ac1WETOx5LCo7a"];
    
    // synchronous code
    
//    PFObject *player = [PFObject objectWithClassName:@"Player"];
//    [player setObject:@"Lokesh" forKey:@"Name"];
//    [player setObject:[NSNumber numberWithInt:1230] forKey:@"Score"];
//    [player save];
    
    // asynchronous code
    
//    PFObject *anotherPlayer = [PFObject objectWithClassName:@"Player"];
//    [anotherPlayer setObject:@"Guddu" forKey:@"Name"];
//    [anotherPlayer setObject:[NSNumber numberWithInt:840] forKey:@"Score"];
//    [anotherPlayer saveInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
//        
//        if (succeeded){
//            NSLog(@"Object Uploaded!");
//        }
//        else {
//            NSString *errorString = [[error userInfo] objectForKey:@"error"];
//            NSLog(@"Error: %@", errorString);
//        }
//        
//    }];
    
    // retreive players
    
    PFQuery *query = [PFQuery queryWithClassName:@"Player"];
    [query whereKey:@"Score" greaterThan:[NSNumber numberWithInt:500]];
    [query findObjectsInBackgroundWithBlock:^(NSArray *objects, NSError *error) {
        if (!error) {
            NSLog(@"Successfully retrieved: %@", objects);
        } else {
            NSString *errorString = [[error userInfo] objectForKey:@"error"];
            NSLog(@"Error: %@", errorString);
        }
    }];
    
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

@end
