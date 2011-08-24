//
//  ClassIntro.h
//  diablo3guide
//
//  Created by zhang yang on 11-8-23.
//  Copyright 2011年 ibm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ClassIntro : UIViewController {
    UIWebView *web;
}

@property (nonatomic, retain) IBOutlet UIWebView *web;

@property (assign , nonatomic) NSString *className;

@end
