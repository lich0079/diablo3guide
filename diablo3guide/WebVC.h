//
//  WebVC.h
//  diablo3guide
//
//  Created by zhang yang on 11-12-5.
//  Copyright (c) 2011年 ibm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WebVC : UIViewController<UIWebViewDelegate>

@property (nonatomic, retain) IBOutlet UIWebView *web;

@property (assign , nonatomic) NSString *className;

@end
