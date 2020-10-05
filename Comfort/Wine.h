//
//  Wine.h
//  Comfort
//
//  Created by Derek Salerno on 4/21/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Wine : NSManagedObject

@property (nonatomic, retain) NSString * bottling;
@property (nonatomic, retain) NSString * category;
@property (nonatomic, retain) NSString * color;
@property (nonatomic, retain) NSString * country;
@property (nonatomic, retain) NSNumber * isActive;
@property (nonatomic, retain) NSNumber * isOldWorld;
@property (nonatomic, retain) NSString * name;
@property (nonatomic, retain) NSString * notes;
@property (nonatomic, retain) NSString * price;
@property (nonatomic, retain) NSNumber * rating;
@property (nonatomic, retain) NSString * region;
@property (nonatomic, retain) NSString * type;
@property (nonatomic, retain) NSString * varietals;
@property (nonatomic, retain) NSString * vintage;
@property (nonatomic, retain) NSString * winery;
-(NSString *)detailString;
-(NSString *)description;

@end
