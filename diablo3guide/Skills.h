//
//  Skills.h
//  diablo3guide
//
//  Created by zhang yang on 11-8-22.
//  Copyright 2011年 ibm. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Skills : BaseTable {

}


@property (assign , nonatomic) NSString *className;
@property BOOL isActive;
@property (assign , nonatomic) NSArray *skills;

@end
