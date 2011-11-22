//
//  ClassIntro.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-23.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "ClassIntro.h"

@implementation ClassIntro
@synthesize web,className;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle

-(void)viewWillAppear:(BOOL)animated{

}

- (void)viewDidLoad {
    [super viewDidLoad];
    NSString *htmlName = [NSString stringWithFormat:@"%@.html",className];
    NSString *path = [[NSBundle mainBundle] pathForResource:htmlName ofType:nil];
    NSURL *url = [NSURL fileURLWithPath:path];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [web loadRequest:request];
    //    UIScrollView *scroller = [web.subviews objectAtIndex:0];
    //    if (scroller){
    //        scroller.bounces = YES;
    //        scroller.alwaysBounceVertical = YES;
    //        scroller.alwaysBounceHorizontal = NO;
    //    }
    
    [self backButton];
}

- (void)viewDidUnload {
    [self setWeb:nil];
    [super viewDidUnload];
}



- (void)dealloc {
    CLogc;
    [web release];
    [super dealloc];
}
@end
