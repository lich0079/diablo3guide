//
//  MainScreenVC.h
//  diablo3guide
//
//  Created by zhang yang on 11-11-22.
//  Copyright (c) 2011年 ibm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MainScreenVC : UIViewController

@property (retain, nonatomic) IBOutlet UILabel *basicLabel;
@property (retain, nonatomic) IBOutlet UILabel *classesLabel;
@property (retain, nonatomic) IBOutlet UILabel *followersLabel;
@property (retain, nonatomic) IBOutlet UILabel *combatLabel;
@property (retain, nonatomic) IBOutlet UILabel *interfaceLabel;


-(void) help:(id)sender;
- (IBAction)basicClick:(id)sender;
- (IBAction)followersClick:(id)sender;
- (IBAction)classesClick:(id)sender;
- (IBAction)combatClick:(id)sender;
- (IBAction)interfaceClick:(id)sender;


@end
