//
//  ParseApplicationSettings.h
//  Domain
//
//  Created by Nick Peachey on 04/06/2014.
//  Copyright (c) 2014 AO PLC. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ParseApplicationSettings : NSObject

@property (nonatomic, strong) NSString *applicationId;
@property (nonatomic, strong) NSString *masterKey;
@property (nonatomic, strong) NSString *clientKey;

-(id)initWithData:(NSDictionary *)dictionary;

@end
