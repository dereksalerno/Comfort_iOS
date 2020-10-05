//
//  LiquorParser.h
//  Comfort
//
//  Created by Derek Salerno on 2/1/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AppDelegate.h"

@class Liquor;

@interface LiquorParser : NSObject <NSXMLParserDelegate>{
    NSMutableString *currentElementValue;
    Liquor *liquor;
    NSMutableArray *liquors;
}

@property (strong, nonatomic)Liquor *liquor;
@property (strong, nonatomic)NSMutableArray *liquors;
@property (strong, nonatomic)NSMutableString *currentElementValue;
@property (strong, nonatomic)NSManagedObjectContext *managedObjectContext;

-(LiquorParser *) initLiquorParser;
-(NSMutableArray*)doParse:(NSData*)data;
@end
