//
//  RestKitTestAppDelegate.m
//  RestKitTest
//
//  Created by Stephan Eletzhofer on 24.02.11.
//  Copyright 2011 Nexiles GmbH. All rights reserved.
//

#import <RestKit/RestKit.h>

#import "RestKitTestAppDelegate.h"
#import "RootViewController.h"

#import "ProjectModel.h"


@implementation RestKitTestAppDelegate

@synthesize window;
@synthesize navigationController;

#define BASE_URL @"http://127.0.0.1:8000"

#pragma mark -
#pragma mark Application lifecycle

- (void)awakeFromNib
{   PersonModel 
    
    RootViewController *rootViewController = (RootViewController *)[navigationController topViewController];
}


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{    
    NSLog(@"application:didFinishLaunchingWithOptions: opts=%@", launchOptions);
    // Initialize RestKit
    RKObjectManager *objectManager = [RKObjectManager objectManagerWithBaseURL:BASE_URL];

    // Initialize object store
    objectManager.objectStore = [[[RKManagedObjectStore alloc] initWithStoreFilename:@"RestKitTest.sqlite"] autorelease];

    [objectManager loadObjectsAtResourcePath:@"/projects.json"
                                 objectClass:[ProjectModel class]
                                    delegate:self];

    // Override point for customization after application launch.

    // Add the navigation controller's view to the window and display.
    [self.window addSubview:navigationController.view];
    [self.window makeKeyAndVisible];

    return YES;
}

#pragma mark -
#pragma mark RKObjectLoaderDelegate methods

- (void)objectLoader:(RKObjectLoader*)objectLoader didLoadObjects:(NSArray*)objects
{
    NSLog(@"objectLoader:didLoadObjects:");
    NSLog(@"Loaded objects: %@", objects);
}

- (void)objectLoader:(RKObjectLoader*)objectLoader didFailWithError:(NSError*)error
{
    NSLog(@"objectLoader:didFailWithError:");
    UIAlertView* alert = [[[UIAlertView alloc] initWithTitle:@"Error" message:[error localizedDescription] delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil] autorelease];
    [alert show];
    NSLog(@"Hit error: %@", error);
}

#pragma mark -
#pragma mark Application Cycle

- (void)applicationWillResignActive:(UIApplication *)application {
    /*
     Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
     Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
     */
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    /*
     Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
     If your application supports background execution, called instead of applicationWillTerminate: when the user quits.
     */
    [self saveContext];
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    /*
     Called as part of  transition from the background to the inactive state: here you can undo many of the changes made on entering the background.
     */
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    /*
     Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
     */
}


/**
 applicationWillTerminate: saves changes in the application's managed object context before the application terminates.
 */
- (void)applicationWillTerminate:(UIApplication *)application {
    [self saveContext];
}


- (void)saveContext
{
    NSLog(@"saveContext");
}    

#pragma mark -
#pragma mark Application's Documents directory

/**
 Returns the URL to the application's Documents directory.
 */
- (NSURL *)applicationDocumentsDirectory {
    return [[[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask] lastObject];
}


#pragma mark -
#pragma mark Memory management

- (void)applicationDidReceiveMemoryWarning:(UIApplication *)application {
    /*
     Free up as much memory as possible by purging cached data objects that can be recreated (or reloaded from disk) later.
     */
}


- (void)dealloc
{
    [navigationController release];
    [window release];
    [super dealloc];
}


@end
// vim: set sw=4 ts=4 expandtab:
