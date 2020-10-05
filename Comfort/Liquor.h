//
//  Liquor.h
//  Comfort
//
//  Created by Derek Salerno on 4/21/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Liquor : NSManagedObject

@property (nonatomic, retain) NSString * age;
@property (nonatomic, retain) NSString * bottling;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * distiller;
@property (nonatomic, retain) NSNumber * isActive;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * place;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSString * proof;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSNumber * isCocktail;
@property (nonatomic, retain) NSString * name;

-(NSString*)description;
-(NSString*)detailString;
-(NSString*)subtitleDescription;

@end
