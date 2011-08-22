//
//  RootViewController.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "RootViewController.h"
#import "ClassSelect.h"

@implementation RootViewController


- (void)viewDidLoad
{
    [super viewDidLoad];
    self.title = @"Daiblo 3 ";
    UIImageView *background = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"bg.png"]];
    [[self tableView] setBackgroundView:background];
    [background autorelease];
    
//    UIImage *image = [UIImage imageNamed:@"naviBg.png"];
//    UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
//    imageView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;//autoresizing
//    [self.navigationController.navigationBar addSubview:imageView];
//    [self.navigationController.navigationBar sendSubviewToBack:imageView];
//    [imageView release];
    
    self.tableView.rowHeight = 120;
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier] autorelease];
    }
    int row = indexPath.row;
    switch (row) {
        case 0:
            cell.textLabel.text = @"";
            UIImage *bimage = [UIImage imageNamed:@"basic2.png"];
            UIImageView *bimageView = [[UIImageView alloc] initWithImage:bimage];
            bimageView.frame = CGRectMake(0, 0, bimage.size.width, bimage.size.height);
            [cell addSubview:bimageView];
            [bimageView release];
            
            UILabel *blabel = [[UILabel alloc]initWithFrame:CGRectMake(0, bimageView.frame.size.height-30, 320, 30)];
            blabel.text = @"Basic System";
            blabel.backgroundColor = [UIColor clearColor];
            [cell addSubview:blabel];
            [blabel release];
            blabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
            blabel.textAlignment = UITextAlignmentCenter;
            blabel.font = [UIFont fontWithName:@"Cochin" size:28];
            break;
        case 1:
            cell.textLabel.text = @"";
            UIImage *image = [UIImage imageNamed:@"classes.png"];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            [cell addSubview:imageView];
            [imageView release];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, imageView.frame.size.height-30, 320, 30)];
            label.text = @"Character Classes";
            label.backgroundColor = [UIColor clearColor];
            [cell addSubview:label];
            [label release];
            label.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
            label.textAlignment = UITextAlignmentCenter;
            label.font = [UIFont fontWithName:@"Cochin" size:28];
            break;
            
        default:
            break;
    }
    return cell;
}
//
//-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    return 120;
//}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIViewController *controller; 
    switch (indexPath.row) {
        case 1:
            controller = [[ClassSelect alloc] init];
            break;
            
        default:
            break;
    }
    
    // ...
    // Pass the selected object to the new view controller.
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

- (void)dealloc
{
    [super dealloc];
}

@end
