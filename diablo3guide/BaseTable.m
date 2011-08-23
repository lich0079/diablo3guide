//
//  BaseTable.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "BaseTable.h"


@implementation BaseTable

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    [[self tableView] setBackgroundView:background];
    [background autorelease];
//    self.tableView.separatorColor = [UIColor orangeColor];
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    //    UIImage *image = [UIImage imageNamed:@"naviBg.png"];
    //    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
    //    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//autoresizing
    //    [self.navigationController.navigationBar addSubview:imageView];
    //    [self.navigationController.navigationBar sendSubviewToBack:imageView];
    //    [imageView release];
}


@end
