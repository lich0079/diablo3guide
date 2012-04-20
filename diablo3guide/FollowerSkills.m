//
//  FollowerSkills.m
//  diablo3guide
//
//  Created by zhang yang on 11-11-22.
//  Copyright (c) 2011年 ibm. All rights reserved.
//

#import "FollowerSkills.h"

@implementation FollowerSkills

@synthesize skills,className;

- (id)initWithStyle:(UITableViewStyle)style {
    self = [super initWithStyle:style];
    if (self) {
    }
    return self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - View lifecycle
-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self titleView].text = className;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self backButton];
    
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void) dealloc{
    CLogc;
    [super dealloc];
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [skills count];
}

//- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
//    UILabel *titleView = [[UILabel alloc]init];
//    titleView.backgroundColor = [UIColor clearColor];
//    titleView.textAlignment = UITextAlignmentCenter;
//    titleView.textColor = [UIColor  groupTableViewBackgroundColor];
//    titleView.font = [UIFont fontWithName:@"Cochin" size:12];
//    titleView.text = @"Note: Information is based on level 60.";
//    return [titleView autorelease];
//}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    
    NSDictionary *skill = [skills objectAtIndex:indexPath.row];
    NSString *skillName = [skill objectForKey:@"name"];
    
    //skill png
    NSString *imageName = [skill objectForKey:@"img"];
    if ([imageName isEqualToString:@"Multishot"]) {
        imageName = @"MultishotF";
    }
    NSString *path = [[NSBundle mainBundle] pathForResource:imageName ofType:@"png"]; 
    UIImage *bimage = [UIImage imageWithContentsOfFile:path];
    UIImageView *bimageView = [[UIImageView alloc] initWithImage:bimage];
    bimageView.frame = CGRectMake(2, 2, 64, 64);
    [cell addSubview:bimageView];
    [bimageView release];
    //skill name
    UILabel *skillNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 1, 180, 18)];
    skillNameLabel.text = skillName;
    skillNameLabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:skillNameLabel];
    [skillNameLabel release];
    skillNameLabel.textColor = [UIColor  redColor];
    skillNameLabel.font = [UIFont fontWithName:@"Cochin" size:20];
    //skill unlock
    NSString *unlock = [[NSBundle mainBundle] pathForResource:@"unlock" ofType:@"png"]; 
    UIImage *unlockImage = [UIImage imageWithContentsOfFile:unlock];
    UIImageView *unlockImageView = [[UIImageView alloc] initWithImage:unlockImage];
    unlockImageView.frame = CGRectMake(290, 2, 28, 40);
    [cell addSubview:unlockImageView];
    [unlockImageView release];
    //skill level
    UILabel *level = [[UILabel alloc]initWithFrame:CGRectMake(295, 16, 20, 30)];
    level.text = [NSString stringWithFormat:@"%@", [skill objectForKey:@"level"]];
    level.backgroundColor = [UIColor clearColor];
    level.textAlignment = UITextAlignmentCenter;
    level.textColor = [UIColor greenColor];
    level.font = [UIFont fontWithName:@"Cochin" size:13];
    [cell addSubview:level];
    [level release];

    //skill cost1
    if ([skill objectForKey:@"cost1"]) {
        NSString *cost1 = [skill objectForKey:@"cost1"];
        UILabel *cost1Label = [[UILabel alloc]initWithFrame:CGRectMake(70, 20, 250, 15)];
        cost1Label.text = cost1;
        cost1Label.backgroundColor = [UIColor clearColor];
        [cell addSubview:cost1Label];
        [cost1Label release];
        cost1Label.textColor = [UIColor  greenColor];
        cost1Label.font = [UIFont fontWithName:@"Cochin" size:15];
    }
    
    float height = 70;
    
    //skill desc1
    if ([skill objectForKey:@"desc1"]) {
        NSString *desc2Str = [skill objectForKey:@"desc1"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc2Size = [desc2Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        UILabel *desc2 = [[UILabel alloc]initWithFrame:CGRectMake(1, height, 320, desc2Size.height)];
        desc2.text = desc2Str;
        desc2.backgroundColor = [UIColor clearColor];
        desc2.lineBreakMode = UILineBreakModeWordWrap;
        desc2.numberOfLines = 0;
        [cell addSubview:desc2];
        [desc2 release];
        desc2.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
        desc2.font = [UIFont fontWithName:@"Cochin" size:15];
        height += desc2Size.height;
    }
    
    //serp png
    UIImage *serpImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"serp" ofType:@"png"]];
    UIImageView *serpImageView = [[UIImageView alloc] initWithImage:serpImage];
    serpImageView.frame = CGRectMake(0, height+5, 320, 5);
    [cell addSubview:serpImageView];
    [serpImageView release];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float height = 70;
    
    NSDictionary *skill = [skills objectAtIndex:indexPath.row];
    
    if ([skill objectForKey:@"desc1"]) {
        NSString *desc2Str = [skill objectForKey:@"desc1"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc2Size = [desc2Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        height += desc2Size.height;
    }
    height += 10;
    return height > 70? height:70;
}



@end
