//
//  Skills.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "Skills.h"

@implementation Skills

@synthesize skills,className,isActive;

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
    //skill level
    UILabel *level = [[UILabel alloc]initWithFrame:CGRectMake(260, 1, 60, 15)];
    level.text = [NSString stringWithFormat:@"Level %@", [skill objectForKey:@"level"]];
    level.backgroundColor = [UIColor clearColor];
    [cell addSubview:level];
    [level release];
    level.textColor = [UIColor  greenColor];
    level.font = [UIFont fontWithName:@"Cochin" size:15];
    //skill desc1
    NSString *desc1Str = [skill objectForKey:@"desc1"];
    UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
    CGSize constraintSize = CGSizeMake(250, MAXFLOAT);
    CGSize desc1Size = [desc1Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    
    UILabel *desc1 = [[UILabel alloc]initWithFrame:CGRectMake(70, 17, 250, desc1Size.height)];
    desc1.text = desc1Str;
    desc1.backgroundColor = [UIColor clearColor];
    desc1.lineBreakMode = UILineBreakModeWordWrap;
    desc1.numberOfLines = 0;
    [cell addSubview:desc1];
    [desc1 release];
    desc1.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    desc1.font = [UIFont fontWithName:@"Cochin" size:15];
    
    float height =17;
    height += (desc1Size.height > 53 ? desc1Size.height:53); 
    //skill desc2
    if ([skill objectForKey:@"desc2"]) {
        NSString *desc2Str = [skill objectForKey:@"desc2"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc2Size = [desc2Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        
        UILabel *desc2 = [[UILabel alloc]initWithFrame:CGRectMake(1, (desc1Size.height + 20 > 70?desc1Size.height + 20:70), 320, desc2Size.height)];
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

    return cell;
}

-(CGFloat) tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    float height = 17;
    
    NSDictionary *skill = [skills objectAtIndex:indexPath.row];
    
    NSString *desc1Str = [skill objectForKey:@"desc1"];
    UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
    CGSize constraintSize = CGSizeMake(250, MAXFLOAT);
    CGSize desc1Size = [desc1Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
    height += (desc1Size.height > 53 ? desc1Size.height:53);
    
    if ([skill objectForKey:@"desc2"]) {
        NSString *desc2Str = [skill objectForKey:@"desc2"];
        UIFont *cellFont = [UIFont fontWithName:@"Cochin" size:15];
        CGSize constraintSize = CGSizeMake(320, MAXFLOAT);
        CGSize desc2Size = [desc2Str sizeWithFont:cellFont constrainedToSize:constraintSize lineBreakMode:UILineBreakModeWordWrap];
        height += desc2Size.height;
    }
    height += 20;
    return height > 70? height:70;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];

}
@end
