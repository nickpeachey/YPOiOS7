//
//  AppDelegate.m
//  YPO Pennine
//
//  Created by Nick Peachey on 09/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import "AppDelegate.h"
#import <Parse/Parse.h>
#import "Domain/Member.h"
#import "Domain/MenuOption.h"

@interface AppDelegate()

-(void)loadConfiguration;

@end

@implementation AppDelegate

- (void)registerClasses
{
    [Member registerSubclass];
    [MenuOption registerSubclass];
}

-(void)loadConfiguration
{
    NSString *path = [[NSBundle mainBundle] pathForResource:@"application" ofType:@"plist"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithContentsOfFile:path];
    self.parseApplicationSetttings = [[ParseApplicationSettings alloc] initWithData:dictionary];
}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
    [self loadConfiguration];
    [self registerClasses];
    [Parse setApplicationId:[self.parseApplicationSetttings applicationId]
                  clientKey:[self.parseApplicationSetttings clientKey]];
    
    [PFAnalytics trackAppOpenedWithLaunchOptions:launchOptions];
    // Override point for customization after application launch.

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
