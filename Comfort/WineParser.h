//
//  WineParser.h
//  Comfort
//
//  Created by Derek Salerno on 2/3/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Wine;

@interface WineParser : NSObject <NSXMLParserDelegate>{
    NSMutableString *currentElementValue;
    Wine *wine;
    NSMutableArray *wines;
}

@property (strong, nonatomic)Wine *wine;
@property (strong, nonatomic)NSMutableArray *wines;
@property (strong, nonatomic)NSMutableString *currentElementValue;


-(WineParser *) initWineParser;
-(NSMutableArray*)doParse:(NSData*)data;
@end
