//
//  ArtisansSelect.m
//  diablo3guide
//
//  Created by zhang yang on 11-12-8.
//  Copyright (c) 2011年 ibm. All rights reserved.
//

#import "ArtisansSelect.h"
#import "WebVC.h"

@implementation ArtisansSelect

@synthesize artisanNames;

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
    [self titleView].text = @"Artisans";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
	self.artisanNames = [NSArray arrayWithObjects:@"Blacksmith",@"Jeweler",@"Mystic", nil];
    self.tableView.rowHeight = 140;
    [self backButton];
}

- (void)viewDidUnload {
    [super viewDidUnload];
}

-(void) dealloc{
    CLogc;
    [self.artisanNames release];
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
    return [artisanNames count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    UITableViewCell *cell = [[[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil] autorelease];
    
    
    NSString *name = [artisanNames objectAtIndex:indexPath.row];

    //bg png
    NSString *bgName = [NSString stringWithFormat:@"%@cellbg",name];
    NSString *bgNamepath = [[NSBundle mainBundle] pathForResource:bgName ofType:@"png"]; 
    UIImage *bgimage = [UIImage imageWithContentsOfFile:bgNamepath];
    UIImageView *bgimageView = [[UIImageView alloc] initWithImage:bgimage];
    cell.backgroundView = bgimageView;
    [bgimageView release];
    //class name
    UILabel *classnamelabel = [[UILabel alloc]initWithFrame:CGRectMake(2, 82, 135, 30)];
    classnamelabel.text = name;
    classnamelabel.backgroundColor = [UIColor clearColor];
    classnamelabel.textAlignment = UITextAlignmentCenter;
    classnamelabel.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    classnamelabel.font = [UIFont fontWithName:normalfont size:17];
    [cell addSubview:classnamelabel];
    [classnamelabel release];
    
    //follower desc
    UILabel *desc = [[UILabel alloc]initWithFrame:CGRectMake(10, 100, 300, 40)];
    switch (indexPath.row) {
        case 0:
            desc.text = @"Steely forge-master who creates and repairs mighty weapons and pieces of armor.";
            break;
        case 1:
            desc.text = @"Wandering jewelcrafter who can combine and improve powerful gems.";
            break;
        case 2:
            desc.text = @"Seer who uses her talents to infuse your items with magical properties.";
            break;
    }
    
    desc.backgroundColor = [UIColor clearColor];
    [cell addSubview:desc];
    [desc release];
    desc.textColor = [UIColor  colorWithRed:115 green:72 blue:0 alpha:1];
    desc.font = [UIFont fontWithName:@"Cochin" size:15];
    desc.textAlignment = UITextAlignmentCenter;
	desc.numberOfLines = 0;
	desc.lineBreakMode = UILineBreakModeWordWrap;
    
    //serp png
    UIImage *serpImage = [UIImage imageWithContentsOfFile:[[NSBundle mainBundle] pathForResource:@"serp" ofType:@"png"]];
    UIImageView *serpImageView = [[UIImageView alloc] initWithImage:serpImage];
    serpImageView.frame = CGRectMake(0, 138, 320, 4);
    [cell addSubview:serpImageView];
    [serpImageView release];
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NSString *name = [artisanNames objectAtIndex:indexPath.row];
    WebVC *controller = [[WebVC alloc] init];
    [self titleView].text = [NSString stringWithFormat:@"%@ Overview",name];
    controller.className = name;
    NSDictionary *dictionary = [NSDictionary dictionaryWithObjectsAndKeys:controller.className, a_overview, nil];
    [FlurryAnalytics logEvent:a_overview withParameters:dictionary];
    [self.navigationController pushViewController:controller animated:YES];
    [controller release];
}

@end
