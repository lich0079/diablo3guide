//
//  ClassSelect.m
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import "ClassSelect.h"
#import "PassiveSkills.h"
#import "WebVC.h"
#import "ActiveSkills.h"

@implementation ClassSelect

@synthesize classes;

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
    [self titleView].text = NSLocalizedString(@"classes", nil);;
}

- (void)viewDidLoad {
    [super viewDidLoad];
//    self.title= NSLocalizedString(@"Class Select", @"Class Select");
    
    NSString *path = [[NSBundle mainBundle] pathForResource:@"classes" ofType:@"plist"];
	NSData *plistData = [NSData dataWithContentsOfFile:path];
	NSString *error;
	NSPropertyListFormat format;
	self.classes = [NSPropertyListSerialization propertyListFromData:plistData
                                                          mutabilityOption:NSPropertyListImmutable
                                                                    format:&format
                                                          errorDescription:&error];
    self.tableView.rowHeight = 114;
    [self backButton];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void) dealloc{
    CLogc;
    [self.classes release];
    [super dealloc];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [classes count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    

    NSDictionary *class = [classes objectAtIndex:indexPath.row];
    //class png
    NSString *path = [[NSBundle mainBundle] pathForResource:[class objectForKey:@"icon"] ofType:@"png"]; 
    UIImage *bimage = [UIImage imageWithContentsOfFile:path];
    UIImageView *bimageView = [[UIImageView alloc] initWithImage:bimage];
    bimageView.frame = CGRectMake(32, 0, bimage.size.width, bimage.size.height);
    [cell addSubview:bimageView];
    [bimageView release];
    //bg png
    NSString *bgName = [NSString stringWithFormat:@"%@cellbg",[class objectForKey:@"icon"]];
    NSString *bgNamepath = [[NSBundle mainBundle] pathForResource:bgName ofType:@"png"]; 
    UIImage *bgimage = [UIImage imageWithContentsOfFile:bgNamepath];
    UIImageView *bgimageView = [[UIImageView alloc] initWithImage:bgimage];
    cell.backgroundView = bgimageView;
    [bgimageView release];
    //class name
    UILabel *classnamelabel = [[UILabel alloc]initWithFrame:CGRectMake(7, 82, 170, 30)];
    classnamelabel.text = [class objectForKey:@"name"];
    classnamelabel.backgroundColor = [UIColor clearColor];
    classnamelabel.textAlignment = UITextAlignmentCenter;
    classnamelabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    classnamelabel.font = [UIFont fontWithName:normalfont size:17];
    [cell addSubview:classnamelabel];
    [classnamelabel release];
    //class Active Skills
    UIButton *aSkill = [UIButton buttonWithType:UIButtonTypeCustom];
    aSkill.tag = indexPath.row;
    aSkill.frame = CGRectMake(170, 32, 130, 30);
    NSString *askillImgpath = [[NSBundle mainBundle] pathForResource:@"bar" ofType:@"png"]; 
    UIImage *askillimage = [UIImage imageWithContentsOfFile:askillImgpath];
    [aSkill setImage:askillimage forState:UIControlStateNormal];
    [aSkill setImage:askillimage forState:UIControlStateSelected];
    aSkill.alpha = 0.9;
    [aSkill addTarget:self action:@selector(aSkill:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:aSkill];
    
    UILabel *aSkilllabel = [[UILabel alloc]initWithFrame:CGRectMake(187, 32, 100, 30)];
    aSkilllabel.text = NSLocalizedString(@"Active Skills", nil);
    aSkilllabel.textAlignment = UITextAlignmentCenter;
    aSkilllabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:aSkilllabel];
    [aSkilllabel release];
    aSkilllabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    aSkilllabel.font = [UIFont fontWithName:@"Cochin" size:17];
    //class Passive Skills
    UIButton *pSkill = [UIButton buttonWithType:UIButtonTypeCustom];
    pSkill.tag = indexPath.row;
    pSkill.frame = CGRectMake(170, 70, 130, 30);
    NSString *pSkillImgpath = [[NSBundle mainBundle] pathForResource:@"bar2" ofType:@"png"]; 
    UIImage *pSkillimage = [UIImage imageWithContentsOfFile:pSkillImgpath];
    [pSkill setImage:pSkillimage forState:UIControlStateNormal];
    [pSkill setImage:pSkillimage forState:UIControlStateSelected];
    pSkill.alpha = 0.9;
    [pSkill addTarget:self action:@selector(pSkill:) forControlEvents:UIControlEventTouchUpInside];
    [cell addSubview:pSkill];
    
    UILabel *pSkilllabel = [[UILabel alloc]initWithFrame:CGRectMake(187, 70, 100, 30)];
    pSkilllabel.text = NSLocalizedString(@"Passive Skills", nil);
    pSkilllabel.textAlignment = UITextAlignmentCenter;
    pSkilllabel.backgroundColor = [UIColor clearColor];
    [cell addSubview:pSkilllabel];
    [pSkilllabel release];
    pSkilllabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    pSkilllabel.font = [UIFont fontWithName:@"Cochin" size:17];
    
    //serp png
    UIImage *serpImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"serp" ofType:@"png"]];
    UIImageView *serpImageView = [[UIImageView alloc] initWithImage:serpImage];
    serpImageView.frame = CGRectMake(0, 112, 320, 4);
    [cell addSubview:serpImageView];
    [serpImageView release];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

-(void) aSkill:(id)sender {
    UIButton *aSkill = sender;
    NSDictionary *class = [classes objectAtIndex:aSkill.tag];
    ActiveSkills *controller = [[ActiveSkills alloc] init];
//    controller.title = [NSString stringWithFormat:@"%@",[class objectForKey:@"name"]];
    controller.skills = [class objectForKey:@"askill"];
    controller.className = [class objectForKey:@"name"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:controller.className, a_askill, nil];
    [FlurryAnalytics logEvent:a_askill withParameters:dictionary];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

-(void) pSkill:(id)sender {
    UIButton *aSkill = sender;
    NSDictionary *class = [classes objectAtIndex:aSkill.tag];
    PassiveSkills *controller = [[PassiveSkills alloc] init];
//    controller.title = [NSString stringWithFormat:@"%@",[class objectForKey:@"name"]];
    controller.skills = [class objectForKey:@"pskill"];
    controller.className = [class objectForKey:@"name"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:controller.className, a_pskill, nil];
    [FlurryAnalytics logEvent:a_pskill withParameters:dictionary];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary *class = [classes objectAtIndex:indexPath.row];
    WebVC *controller = [[WebVC alloc] init];
    [self titleView].text = [NSString stringWithFormat:@"%@ %@",[class objectForKey:@"name"],NSLocalizedString(@"overview", nil)];
    controller.className = [class objectForKey:@"overview"];
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:controller.className, a_overview, nil];
    [FlurryAnalytics logEvent:a_overview withParameters:dictionary];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

@end
