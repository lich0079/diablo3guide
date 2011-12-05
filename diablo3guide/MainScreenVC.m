//
//  MainScreenVC.m
//  diablo3guide
//
//  Created by zhang yang on 11-11-22.
//  Copyright (c) 2011年 ibm. All rights reserved.
//

#import "MainScreenVC.h"
#import "ClassSelect.h"
#import "FollowerSelect.h"
#import "WebVC.h"

@implementation MainScreenVC
@synthesize basicLabel;
@synthesize classesLabel;
@synthesize followersLabel;
@synthesize combatLabel;
@synthesize interfaceLabel;

-(void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self titleView].text = @"Diablo 3";
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UILabel *titleView = [[UILabel alloc]initWithFrame:CGRectMake(0, 10, 320, 25)];
    titleView.backgroundColor = [UIColor clearColor];
    titleView.textAlignment = UITextAlignmentCenter;
    titleView.textColor = [UIColor  yellowColor];
    titleView.font = [UIFont fontWithName:normalfont size:22];
    [self.navigationController.navigationBar addSubview:titleView];
    [titleView release];
    
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
    
    
    
    basicLabel.font = [UIFont fontWithName:normalfont size:17];
    classesLabel.font = [UIFont fontWithName:normalfont size:17];
    followersLabel.font = [UIFont fontWithName:normalfont size:17];
    combatLabel.font = [UIFont fontWithName:normalfont size:17];
    interfaceLabel.font = [UIFont fontWithName:normalfont size:17];
    
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

-(void) help:(id)sender {
    [FlurryAnalytics logEvent:a_help];
//    ClassIntro *Combat = [[ClassIntro alloc]init];
    WebVC *Combat = [[WebVC alloc]init];
    Combat.className = @"Help";
    [self titleView].text = @"Help";
    [self.navigationController pushViewController:Combat animated:YES];
    [Combat release];
}

- (IBAction)basicClick:(id)sender {
    [FlurryAnalytics logEvent:a_basic]; 
    WebVC *basic = [[WebVC alloc]init];
    basic.className = @"Basic";
    [self titleView].text = @"Basic";
    [self.navigationController pushViewController:basic animated:YES];
    [basic release];
}

- (IBAction)followersClick:(id)sender {
    [FlurryAnalytics logEvent:a_follower];
    FollowerSelect *followerSel = [[FollowerSelect alloc] init];
    [self titleView].text = @"Followers";
    [self.navigationController pushViewController:followerSel animated:YES];
    [followerSel release];
}

- (IBAction)classesClick:(id)sender {
    [FlurryAnalytics logEvent:a_class];
    ClassSelect *classSel = [[ClassSelect alloc] init];
    [self titleView].text = @"Classes";
    [self.navigationController pushViewController:classSel animated:YES];
    [classSel release];
}

- (IBAction)combatClick:(id)sender {
    [FlurryAnalytics logEvent:a_combat];
    WebVC *Combat = [[WebVC alloc]init];
    Combat.className = @"Combat";
    [self titleView].text = @"Combat";
    [self.navigationController pushViewController:Combat animated:YES];
    [Combat release];
}

- (IBAction)interfaceClick:(id)sender {
    [FlurryAnalytics logEvent:a_interface];
    WebVC *Interface = [[WebVC alloc]init];
    Interface.className = @"Interface";
    [self titleView].text = @"Interface";
    [self.navigationController pushViewController:Interface animated:YES];
    [Interface release];
}
- (void)dealloc {
    [basicLabel release];
    [classesLabel release];
    [followersLabel release];
    [combatLabel release];
    [interfaceLabel release];
    [super dealloc];
}
- (void)viewDidUnload {
    [self setBasicLabel:nil];
    [self setClassesLabel:nil];
    [self setFollowersLabel:nil];
    [self setCombatLabel:nil];
    [self setInterfaceLabel:nil];
    [super viewDidUnload];
}
@end
