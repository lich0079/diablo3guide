//
//  BaseTable.h
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import <UIKit/UIKit.h>


@interface UIViewController (backButton)
- (void)backButton;
- (void)backClick:(id)sender;
- (UILabel *)titleView;
- (void) share;
- (UIBarButtonItem *)shareButton;
@end

@interface BaseTable : UITableViewController

@end
