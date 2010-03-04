//
//  FillingAppDelegate.m
//  Filling
//
//  Created by Steve Baker on 3/3/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import "FillingAppDelegate.h"
#import "FillingViewController.h"

@implementation FillingAppDelegate

@synthesize window;
@synthesize viewController;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    
    
    // Override point for customization after app launch    
    [window addSubview:viewController.view];
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [viewController release];
    [window release];
    [super dealloc];
}


@end
