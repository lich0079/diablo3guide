//
//  PassiveSkills.m
//  diablo3guide
//
//  Created by zhang yang on 11-9-13.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "PassiveSkills.h"

@implementation PassiveSkills

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
    [self titleView].text = [NSString stringWithFormat:@"%@ %@",className,NSLocalizedString(@"Passive Skills", nil)];
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
    NSString *path = [[NSBundle mainBundle] pathForResource:[skill objectForKey:@"img"] ofType:@"png"]; 
    UIImage *bimage = [UIImage imageWithContentsOfFile:path];
    UIImageView *bimageView = [[UIImageView alloc] initWithImage:bimage];
    bimageView.frame = CGRectMake(2, 2, 64, 64);
    [cell addSubview:bimageView];
    [bimageView release];
    //skill name
    UILabel *skillNameLabel = [[UILabel alloc]initWithFrame:CGRectMake(70, 5, 180, 20)];
    skillNameLabel.text = skillName;
    skillNameLabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:skillNameLabel];
    [skillNameLabel release];
    skillNameLabel.textColor = [UIColor  redColor];
    skillNameLabel.font = [UIFont fontWithName:@"Cochin" size:18];
    //skill unlock
    NSString *unlock = [[NSBundle mainBundle] pathForResource:@"unlock" ofType:@"png"]; 
    UIImage *unlockImage = [UIImage imageWithContentsOfFile:unlock];
    UIImageView *unlockImageView = [[UIImageView alloc] initWithImage:unlockImage];
    unlockImageView.frame = CGRectMake(295, 2, 21, 30);
    [cell addSubview:unlockImageView];
    [unlockImageView release];
    //skill level
    UILabel *level = [[UILabel alloc]initWithFrame:CGRectMake(296, 10, 20, 30)];
    level.text = [NSString stringWithFormat:@"%@", [skill objectForKey:@"level"]];
    level.backgroundColor = [UIColor clearColor];
    level.textAlignment = UITextAlignmentCenter;
    level.textColor = [UIColor greenColor];
    level.font = [UIFont fontWithName:@"Cochin" size:10];
    [cell addSubview:level];
    [level release];
    //skill desc1
    NSString *desc1Str = [skill objectForKey:@"desc1"];
    UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
    CGSize constraintSize = CGSizeMake(250, MAXFLOAT);
    CGSize desc1Size = [desc1Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    UILabel *desc1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 27, 250, desc1Size.height)];
    desc1.text = desc1Str;
    desc1.backgroundColor = [UIColor clearColor];
    desc1.lineBreakMode = UILineBreakModeWordWrap;
    desc1.numberOfLines = 0;
    [cell addSubview:desc1];
    [desc1 release];
    desc1.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    desc1.font = [UIFont fontWithName:@"Cochin" size:15];
    
    float height =27;
    height += (desc1Size.height > 43 ? desc1Size.height:43); 
    //skill desc2
    if ([skill objectForKey:@"desc2"]) {
        NSString *desc2Str = [skill objectForKey:@"desc2"];
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
        desc2.textColor = [UIColor  whiteColor];
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
    float height = 27;
    
    NSDictionary *skill = [skills objectAtIndex:indexPath.row];
    
    NSString *desc1Str = [skill objectForKey:@"desc1"];
    UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
    CGSize constraintSize = CGSizeMake(250, MAXFLOAT);
    CGSize desc1Size = [desc1Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    height += (desc1Size.height > 43 ? desc1Size.height:43);
    
    if ([skill objectForKey:@"desc2"]) {
        NSString *desc2Str = [skill objectForKey:@"desc2"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc2Size = [desc2Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        height += desc2Size.height;
    }
    height += 10;
    return height > 70? height:70;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
}
@end
