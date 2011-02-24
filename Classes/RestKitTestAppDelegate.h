//
//  RestKitTestAppDelegate.h
//  RestKitTest
//
//  Created by Stephan Eletzhofer on 24.02.11.
//  Copyright 2011 Nexiles GmbH. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

#import <RestKit/RestKit.h>

@interface RestKitTestAppDelegate : NSObject <UIApplicationDelegate> {
    
    UIWindow *window;
    UINavigationController *navigationController;

}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

- (NSURL *)applicationDocumentsDirectory;
- (void)saveContext;

@end

