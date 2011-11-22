//
//  BaseTable.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "BaseTable.h"

@implementation UINavigationBar (UINavigationBarCategory)
- (void)drawRect:(CGRect)rect {    
    UIImage *navBarImage = [UIImage imageNamed:@"navi.png"];
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextTranslateCTM(context, 0.0, self.frame.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);       
    
    CGPoint center=self.center;
    
    CGImageRef cgImage= CGImageCreateWithImageInRect(navBarImage.CGImage, CGRectMake(0, 0, 1, 44));
    CGContextDrawImage(context, CGRectMake(center.x-160-80, 0, 80, self.frame.size.height), cgImage);
    CGContextDrawImage(context, CGRectMake(center.x-160, 0, 320, self.frame.size.height), navBarImage.CGImage);
    CGContextDrawImage(context, CGRectMake(center.x+160, 0, 80, self.frame.size.height), cgImage);
    CGImageRelease(cgImage);
}
@end





@implementation UIViewController (backButton)
- (void)backButton {
    UIButton *BackBtn = [[UIButton alloc] initWithFrame:CGRectMake(0.0, 0.0, 62.0, 40.0)];
    [BackBtn setImage:[UIImage imageNamed:@"back.png"] forState:UIControlStateNormal];
    [BackBtn addTarget:self action:@selector(backClick:) forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *BackBarBtn = [[UIBarButtonItem alloc] initWithCustomView:BackBtn];
    self.navigationItem.leftBarButtonItem = BackBarBtn;	
    [BackBtn release];
    [BackBarBtn release];
}

- (void)backClick:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (UILabel *)titleView{
    for (id view in [self.navigationController.navigationBar subviews]) {
        if (NSClassFromString(@"UILabel") == [view class]) {
            return view;
        }
    }
    return nil;
}
@end


@implementation BaseTable

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg2.png"]];
    [[self tableView] setBackgroundView:background];
    [background autorelease];

    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    

    if ([[[UIDevice currentDevice] systemVersion] floatValue] >= 5.0) {
        CLog(@"ios5");
        if ([self.navigationController.navigationBar respondsToSelector:@selector(setBackgroundImage:forBarMetrics:)]){
            //        CLog(@"111");
            [self.navigationController.navigationBar setBackgroundImage:[UIImage imageNamed:@"navi.png"] forBarMetrics:UIBarMetricsDefault];
        }
    }else {
        CLog(@"ios4");
        
    }
}

@end
