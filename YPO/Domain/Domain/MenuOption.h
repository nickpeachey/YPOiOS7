//
//  MenuOption.h
//  Domain
//
//  Created by Nick Peachey on 05/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>


@interface MenuOption : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (retain) NSString *name;
@property (retain) NSString *controller;
@property (retain) NSData *image;

@end
