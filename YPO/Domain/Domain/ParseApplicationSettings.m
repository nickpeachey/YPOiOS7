//
//  ParseApplicationSettings.m
//  Domain
//
//  Created by Nick Peachey on 04/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import "ParseApplicationSettings.h"

#define kApplicationId @"ApplicationID"
#define kMasterKey @"MasterKey"
#define kClientKey @"ClientKey"

@implementation ParseApplicationSettings

-(id)initWithData:(NSDictionary *)dictionary
{
    self = [super init];
    
    if (self) {
        self.applicationId = [dictionary objectForKey:kApplicationId];
        self.masterKey = [dictionary objectForKey:kMasterKey];
        self.clientKey = [dictionary objectForKey:kClientKey];
    }
    
    
    return self;
}

@end
