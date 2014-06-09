//
//  Member.h
//  Domain
//
//  Created by Nick Peachey on 04/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <Parse/Parse.h>
#import <Parse/PFObject+Subclass.h>


@interface Member : PFObject<PFSubclassing>

+ (NSString *)parseClassName;

@property (retain) NSString *surname;


@end
