//
//  Beer.h
//  Comfort
//
//  Created by Derek Salerno on 4/21/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Beer : NSManagedObject

@property (nonatomic, retain) NSString * bottling;
@property (nonatomic, retain) NSString * brewery;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSNumber * hasBottling;
@property (nonatomic, retain) NSNumber * isActive;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * place;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * type;

-(NSString*)detailString;
-(NSString*)description;

@end
