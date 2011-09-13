//
//  ActiveSkills.m
//  diablo3guide
//
//  Created by zhang yang on 11-9-13.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "ActiveSkills.h"
#import "Runestones.h"

@implementation ActiveSkills

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

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    
    NSDictionary *skill = [skills objectAtIndex:indexPath.row];
    NSString *skillName = [skill objectForKey:@"name"];
    
    //skill png
    NSString *path = [[NSBundle mainBundle] pathForResource:skillName ofType:@"png"]; 
    UIImage *bimage = [UIImage imageWithContentsOfFile:path];
    if (!bimage) {
        bimage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"Skill_blank" ofType:@"png"]];
    }
    UIImageView *bimageView = [[UIImageView alloc] initWithImage:bimage];
    bimageView.frame = CGRectMake(2, 2, 64, 64);
    [cell addSubview:bimageView];
    [bimageView release];
    //skill name
    UILabel *skillNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 1, 180, 15)];
    skillNameLabel.text = skillName;
    skillNameLabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:skillNameLabel];
    [skillNameLabel release];
    skillNameLabel.textColor = [UIColor  redColor];
    skillNameLabel.font = [UIFont fontWithName:@"Cochin" size:15];
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
    //runestones
    NSString *runestones = [[NSBundle mainBundle] pathForResource:@"forward" ofType:@"png"]; 
    UIImage *runestonesImage = [UIImage imageWithContentsOfFile:runestones];
    UIImageView *runestonesImageView = [[UIImageView alloc] initWithImage:runestonesImage];
    runestonesImageView.frame = CGRectMake(290, 45, 25, 25);
    [cell addSubview:runestonesImageView];
    [runestonesImageView release];
    //skill category
    NSString *category = [skill objectForKey:@"category"];
    UILabel *categoryLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 17, 180, 15)];
    categoryLabel.text = category;
    categoryLabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:categoryLabel];
    [categoryLabel release];
    categoryLabel.textColor = [UIColor  whiteColor];
    categoryLabel.font = [UIFont fontWithName:@"Cochin" size:15];
    //skill cost1
    if ([skill objectForKey:@"cost1"]) {
        NSString *cost1 = [skill objectForKey:@"cost1"];
        UILabel *cost1Label = [[UILabel alloc]initWithFrame:CGRectMake(70, 34, 250, 15)];
        cost1Label.text = cost1;
        cost1Label.backgroundColor = [UIColor clearColor];
        [cell addSubview:cost1Label];
        [cost1Label release];
        cost1Label.textColor = [UIColor  greenColor];
        cost1Label.font = [UIFont fontWithName:@"Cochin" size:15];
    }
    //skill cost2
    if ([skill objectForKey:@"cost2"]) {
        NSString *cost2 = [skill objectForKey:@"cost2"];
        UILabel *cost2Label = [[UILabel alloc]initWithFrame:CGRectMake(70, 51, 250, 15)];
        cost2Label.text = cost2;
        cost2Label.backgroundColor = [UIColor clearColor];
        [cell addSubview:cost2Label];
        [cost2Label release];
        cost2Label.textColor = [UIColor  greenColor];
        cost2Label.font = [UIFont fontWithName:@"Cochin" size:15];
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
    //skill desc2
    if ([skill objectForKey:@"desc2"]) {
        NSString *desc3Str = [skill objectForKey:@"desc2"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc3Size = [desc3Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        UILabel *desc3 = [[UILabel alloc]initWithFrame:CGRectMake(1, height, 320, desc3Size.height)];
        desc3.text = desc3Str;
        desc3.backgroundColor = [UIColor clearColor];
        desc3.lineBreakMode = UILineBreakModeWordWrap;
        desc3.numberOfLines = 0;
        [cell addSubview:desc3];
        [desc3 release];
        desc3.textColor = [UIColor  colorWithRed:186.0 green:148.0 blue:68.0 alpha:1.0];
        desc3.font = [UIFont fontWithName:@"Cochin" size:15];
        height += desc3Size.height;
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
    if ([skill objectForKey:@"desc2"]) {
        NSString *desc3Str = [skill objectForKey:@"desc2"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc3Size = [desc3Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        height += desc3Size.height;
    }
    height += 10;
    return height > 70? height:70;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *skill = [skills objectAtIndex:indexPath.row];
    Runestones *controller = [[Runestones alloc] init];
    controller.skill = skill;
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

//- (void)tableView: (UITableView*)tableView willDisplayCell: (UITableViewCell*)cell forRowAtIndexPath: (NSIndexPath*)indexPath {
//    cell.backgroundColor = indexPath.row % 2 
//    ? [UIColor redColor] 
//    : [UIColor blueColor] ;
//}

@end