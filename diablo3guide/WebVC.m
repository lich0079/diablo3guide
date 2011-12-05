//
//  WebVC.m
//  diablo3guide
//
//  Created by zhang yang on 11-12-5.
//  Copyright (c) 2011年 ibm. All rights reserved.
//

#import "WebVC.h"

@implementation WebVC

@synthesize web,className;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
    [self.view addSubview:self.web];
}
#pragma mark - View lifecycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.web = [[UIWebView alloc ] initWithFrame:self.view.bounds];
    [self.web release];
    self.web.backgroundColor = [UIColor colorWithPatternImage: [UIImage imageNamed:@"bg2.png"]];
    //        self.web.backgroundColor = [UIColor clearColor];
    NSString *htmlName = [NSString stringWithFormat:@"%@.html",className];
    NSString *path = [[NSBundle mainBundle] pathForResource:htmlName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    web.delegate =self;
    //    UIScrollView *scroller = [web.subviews objectAtIndex:0];
    //    if (scroller){
    //        scroller.bounces = YES;
    //        scroller.alwaysBounceVertical = YES;
    //        scroller.alwaysBounceHorizontal = NO;
    //    }
    [self backButton];
}

- (void)viewDidUnload {
    web.delegate = nil;
    [self setWeb:nil];
    [super viewDidUnload];
}



- (void)dealloc {
    CLogc;
    web.delegate = nil;
    [web release];
    [super dealloc];
}

@end
