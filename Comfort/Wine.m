//
//  Wine.m
//  Comfort
//
//  Created by Derek Salerno on 4/21/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "Wine.h"


@implementation Wine

@dynamic bottling;
@dynamic category;
@dynamic color;
@dynamic country;
@dynamic isActive;
@dynamic isOldWorld;
@dynamic name;
@dynamic notes;
@dynamic price;
@dynamic rating;
@dynamic region;
@dynamic type;
@dynamic varietals;
@dynamic vintage;
@dynamic winery;


-(NSString *)detailString{
    NSMutableString* tmpString = [[NSMutableString alloc]
                                  initWithFormat:@"[Winery]: %@\n", self.winery];
    if (self.bottling){
        [tmpString appendFormat:@"[Bottling]: %@\n",self.bottling];
    }
    if (self.varietals){
        [tmpString appendFormat:@"[Varietals]: %@\n", self.varietals];
    }
    if (self.region){
    [tmpString appendFormat:@"[Region]: %@\n", self.region];
    }
    if (self.country){
        [tmpString appendFormat:@"[Vintage]: %@\n", self.country];
    }
    if (self.vintage){
        [tmpString appendFormat:@"[Vintage]: %@\n", self.vintage];
    }
    [tmpString appendFormat:@"[Price]: %@", self.price];
    return tmpString;
}

-(NSString *)description {
    NSMutableString * tmpString = [[NSMutableString alloc]
                                   initWithFormat:@"%@ ", self.winery];
    if (self.bottling){
        [tmpString appendFormat:@"%@ ", self.bottling];
    }
    if (self.isOldWorld){
        [tmpString appendFormat:@"%@ ", self.region];
    }
    if (!self.isOldWorld){
        [tmpString appendFormat:@"%@ ", self.varietals];
    }
    return tmpString;
}


@end
