//
//  RootViewController.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "RootViewController.h"
#import "ClassSelect.h"
#import "ClassIntro.h"

@implementation RootViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"Daiblo 3 ";
   
    self.tableView.rowHeight = 125;
    
    UIButton *help = [UIButton buttonWithType:UIButtonTypeInfoLight];
    UIBarButtonItem *BackBarBtn = [[UIBarButtonItem alloc] initWithCustomView:help];
    [help addTarget:self action:@selector(help:) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.rightBarButtonItem = BackBarBtn;
    [BackBarBtn release];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    if(![defaults objectForKey:@"version1.0helpchecked"]){
        [self help:nil];
        [defaults setValue:@"YES" forKey:@"version1.0helpchecked"];
        [defaults synchronize];
    }
    
}

-(void) help:(id)sender {
    ClassIntro *Combat = [[ClassIntro alloc]init];
    Combat.className = @"Help";
    Combat.title = @"Help";
    [self.navigationController pushViewController:Combat animated:YES];
    [Combat release];
}

// Customize the number of sections in the table view.
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 4;
}

// Customize the appearance of table view cells.
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    
    int row = indexPath.row;
    switch (row) {
        case 0:
            cell.textLabel.text = @"";
            UIImage *bimage = [UIImage imageNamed:@"Basic3.png"];
            UIImageView *bimageView = [[UIImageView alloc] initWithImage:bimage];
            bimageView.frame = CGRectMake(0, 0, bimage.size.width, bimage.size.height);
            [cell addSubview:bimageView];
            [bimageView release];
            
            UILabel *blabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 320, 30)];
            blabel.text = @"Basic";
            blabel.backgroundColor = [UIColor clearColor];
            [cell addSubview:blabel];
            [blabel release];
            blabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
            blabel.textAlignment = UITextAlignmentCenter;
            blabel.font = [UIFont fontWithName:@"Cochin" size:28];
            break;
        case 1:
            cell.textLabel.text = @"";
            UIImage *image = [UIImage imageNamed:@"classes2.png"];
            UIImageView *imageView = [[UIImageView alloc] initWithImage:image];
            imageView.frame = CGRectMake(0, 0, image.size.width, image.size.height);
            [cell addSubview:imageView];
            [imageView release];
            
            UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 320, 30)];
            label.text = @"Classes";
            label.backgroundColor = [UIColor clearColor];
            [cell addSubview:label];
            [label release];
            label.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
            label.textAlignment = UITextAlignmentCenter;
            label.font = [UIFont fontWithName:@"Cochin" size:28];
            break;
        case 2:
            cell.textLabel.text = @"";
            UIImage *cimage = [UIImage imageNamed:@"Combat.png"];
            UIImageView *cimageView = [[UIImageView alloc] initWithImage:cimage];
            cimageView.frame = CGRectMake(0, 0, cimage.size.width, cimage.size.height);
            [cell addSubview:cimageView];
            [cimageView release];
            
            UILabel *clabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 320, 30)];
            clabel.text = @"Combat";
            clabel.backgroundColor = [UIColor clearColor];
            [cell addSubview:clabel];
            [clabel release];
            clabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
            clabel.textAlignment = UITextAlignmentCenter;
            clabel.font = [UIFont fontWithName:@"Cochin" size:28];
            break;
        case 3:
            cell.textLabel.text = @"";
            UIImage *iimage = [UIImage imageNamed:@"Interface2.png"];
            UIImageView *iimageView = [[UIImageView alloc] initWithImage:iimage];
            iimageView.frame = CGRectMake(0, 0, iimage.size.width, iimage.size.height);
            [cell addSubview:iimageView];
            [iimageView release];
            
            UILabel *ilabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 70, 320, 30)];
            ilabel.text = @"Interface";
            ilabel.backgroundColor = [UIColor clearColor];
            [cell addSubview:ilabel];
            [ilabel release];
            ilabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
            ilabel.textAlignment = UITextAlignmentCenter;
            ilabel.font = [UIFont fontWithName:@"Cochin" size:28];
            break;
        default:
            break;
    }
    //serp png
    UIImage *serpImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"serp" ofType:@"png"]];
    UIImageView *serpImageView = [[UIImageView alloc] initWithImage:serpImage];
    serpImageView.frame = CGRectMake(0, 120, 320, 5);
    [cell addSubview:serpImageView];
    [serpImageView release];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    int index = indexPath.row;
    
    if (index == 0) {
        ClassIntro *basic = [[ClassIntro alloc]init];
        basic.className = @"Basic";
        basic.title = @"Basic";
        [self.navigationController pushViewController:basic animated:YES];
        [basic release];
    }else if (index == 1){
        ClassSelect *classSel = [[ClassSelect alloc] init];
        classSel.title = @"Classes";
        [self.navigationController pushViewController:classSel animated:YES];
        [classSel release];
    }else if (index == 2) {
        ClassIntro *Combat = [[ClassIntro alloc]init];
        Combat.className = @"Combat";
        Combat.title = @"Combat";
        [self.navigationController pushViewController:Combat animated:YES];
        [Combat release];
    }else if (index == 3) {
        ClassIntro *Interface = [[ClassIntro alloc]init];
        Interface.className = @"Interface";
        Interface.title = @"Interface";
        [self.navigationController pushViewController:Interface animated:YES];
        [Interface release];
    }

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
