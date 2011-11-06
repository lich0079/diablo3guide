//
//  diablo3guideAppDelegate.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "diablo3guideAppDelegate.h"

@implementation diablo3guideAppDelegate

@synthesize window = _window;
@synthesize navigationController = _navigationController;

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    self.window.rootViewController = self.navigationController;
    [self.window makeKeyAndVisible];
    
    [MobClick setDelegate:self];
    [MobClick appLaunched];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    [MobClick appTerminated];
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    [MobClick appLaunched];
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
}

- (void)applicationWillTerminate:(UIApplication *)application {
    [MobClick appTerminated];
}

- (void)dealloc
{
    [_window release];
    [_navigationController release];
    [super dealloc];
}

- (NSString *)appKey{
    return @"4ea934865270154d66000074";
}
@end
