//
//  Parser.h
//  Comfort
//
//  Created by Derek Salerno on 4/17/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"
#import "Reachability.h"


@class Liquor, Beer, Wine;


@interface Parser : NSObject <NSXMLParserDelegate>{
    NSMutableString *currentElementValue;
    Beer *beer;
    Liquor *liquor;
    Wine *wine;
    NSMutableArray *liquors;
}

@property (strong, nonatomic)NSNumber *xmlVersion;
@property (strong, nonatomic)Liquor *liquor;
@property (strong, nonatomic)Wine *wine;
@property (strong, nonatomic)Beer *beer;
@property (strong, nonatomic)NSMutableArray *liquors;
@property (strong, nonatomic)NSMutableArray *beers;
@property (strong, nonatomic)NSMutableString *currentElementValue;
@property (strong, nonatomic)NSManagedObjectContext *managedObjectContext;

+(void)checkForUpdate;
-(Parser*)initParser;
-(void)doParse:(NSData*)data;


@end
