//
//  Beer.m
//  Comfort
//
//  Created by Derek Salerno on 4/21/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "Beer.h"


@implementation Beer

@dynamic bottling;
@dynamic brewery;
@dynamic category;
@dynamic hasBottling;
@dynamic isActive;
@dynamic name;
@dynamic notes;
@dynamic place;
@dynamic price;
@dynamic rating;
@dynamic type;


-(NSString*)detailString{
    NSMutableString* tmpString = [[NSMutableString alloc]
                                  initWithFormat:@"[Brewery]: %@\n", self.brewery];
    if (self.bottling){
        [tmpString appendFormat:@"[Bottling]: %@\n",self.bottling];
    }
    [tmpString appendFormat:@"[Place Brewed]: %@\n", self.place];
    [tmpString appendFormat:@"[Price]: %@", self.price];
    return tmpString;
}

-(NSString*)description{
    NSMutableString* tmpVal = [NSMutableString stringWithString:self.brewery];
    if (self.bottling){
        [tmpVal appendFormat:@" %@", self.bottling];
    }
    return tmpVal;
}

@end
