//
//  AppDelegate.h
//  YPO Pennine
//
//  Created by Nick Peachey on 09/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Domain/ParseApplicationSettings.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, strong) ParseApplicationSettings *parseApplicationSetttings;

@end
