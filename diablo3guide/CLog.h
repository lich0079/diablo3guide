//
//  CLog.h
//  geoconverter
//
//  Created by lich0079 on 11-7-11.
//  Copyright 2011年 ibm. All rights reserved.
//
#ifdef DEBUG
#define CLog(format, ...) NSLog(format, ## __VA_ARGS__)
#define CLogc  CLog(@"%s", __FUNCTION__)
#else
#define CLog(format, ...)
#define CLogc
#endif

#define isIPad  UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad
#define normalfont  @"ExocetLight"


#define a_basic @"a_basic"
#define a_class @"a_class"
#define a_follower @"a_follower"
#define a_combat @"a_combat"
#define a_interface @"a_interface"
#define a_help @"a_help"

#define a_overview @"a_overview"
#define a_askill @"a_askill"
#define a_pskill @"a_pskill"
#define a_runestone @"a_runestone"

