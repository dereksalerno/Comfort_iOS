//
//  Liquor.m
//  Comfort
//
//  Created by Derek Salerno on 4/21/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "Liquor.h"


@implementation Liquor

@dynamic age;
@dynamic bottling;
@dynamic category;
@dynamic distiller;
@dynamic isActive;
@dynamic name;
@dynamic notes;
@dynamic place;
@dynamic price;
@dynamic proof;
@dynamic rating;
@dynamic type;
@dynamic isCocktail;



// Check to see if object is a stand-alone spirit with a sub-brand. I.E. Distiller = "Jim Beam" Bottling = "Black". Return a string that joins them
-(NSString*)description{
    if ((self.bottling)&&(!self.isCocktail.boolValue)){
        NSMutableString *tmp = [[NSMutableString alloc]initWithString:self.distiller];
        [tmp appendString:@" "];
        [tmp appendString:self.bottling];
        return tmp;
    }
    else {
        return self.distiller;
    }
}
-(NSString*)subtitleDescription{
    NSString *tmpString;
    if (self.age){
        tmpString = [NSString stringWithFormat:@"%@ %@",self.bottling, self.age];
    }else{
        tmpString = [NSString stringWithString:self.bottling];
    }
    return tmpString;
}
-(NSString*)detailString{
    NSMutableString* tmpString = [[NSMutableString alloc]init];
    //This is the logic for a cocktail description.
    if ([self.isCocktail boolValue] == YES){
        [tmpString appendFormat:@"[Cocktail]: %@\n[Ingredients]: %@\n[Price]: %@", self.distiller, self.bottling, self.price];
    }
    else  {
        [tmpString appendFormat:@"[Distiller]: %@\n", self.distiller];
        if (self.bottling){
            [tmpString appendFormat:@"[Bottling]: %@\n", self.bottling];
        }if (self.age){
            [tmpString appendFormat:@"[Age]: %@\n", self.age];
        }
        if ([self.isCocktail boolValue] == NO){
            [tmpString appendFormat:@"[Place distilled]: %@\n[Proof]: %@\n", self.place, self.proof];
        }
        [tmpString appendFormat:@"[Type]: %@\n[Price]: %@",
                                    self.type, self.price];
    }
    
    return tmpString;
}


@end
