//
//  diablo3guideAppDelegate.h
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface diablo3guideAppDelegate : NSObject <UIApplicationDelegate,MobClickDelegate>

@property (nonatomic, retain) IBOutlet UIWindow *window;

@property (nonatomic, retain) IBOutlet UINavigationController *navigationController;

@end
