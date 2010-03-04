//
//  FillingAppDelegate.h
//  Filling
//
//  Created by Steve Baker on 3/3/10.
//  Copyright Beepscore LLC 2010. All rights reserved.
//

#import <UIKit/UIKit.h>

@class FillingViewController;

@interface FillingAppDelegate : NSObject <UIApplicationDelegate> {
    UIWindow *window;
    FillingViewController *viewController;
}

@property (nonatomic, retain) IBOutlet UIWindow *window;
@property (nonatomic, retain) IBOutlet FillingViewController *viewController;

@end

