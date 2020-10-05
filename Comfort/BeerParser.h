//
//  BeerParser.h
//  Comfort
//
//  Created by Derek Salerno on 2/3/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>

@class Beer;

@interface BeerParser : NSObject <NSXMLParserDelegate>{
    NSMutableString *currentElementValue;
    Beer *beer;
    NSMutableArray *beers;
}
@property (strong, nonatomic)Beer *beer;
@property (strong, nonatomic)NSMutableArray *beers;
@property (strong, nonatomic)NSMutableString *currentElementValue;

-(BeerParser *)initBeerParser;
-(NSMutableArray*)doParse:(NSData*)data;
@end
