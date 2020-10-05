//
//  BeerParser.m
//  Comfort
//
//  Created by Derek Salerno on 2/3/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "BeerParser.h"
#import "Beer.h"
#import "AppDelegate.h"

@implementation BeerParser

@synthesize beer, beers, currentElementValue;


-(BeerParser*) initBeerParser{
    beers = [[NSMutableArray alloc] init];
    return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"beer"]) {
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        NSManagedObjectContext* managedObjectContext = appDelegate.managedObjectContext;
        NSEntityDescription *beerEntity = [NSEntityDescription
                                               entityForName:@"Beer" inManagedObjectContext:managedObjectContext];
        
        beer = [[Beer alloc]
                initWithEntity:beerEntity
                insertIntoManagedObjectContext:managedObjectContext];
        //beer = [[Beer alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
    if (!currentElementValue) {
        NSString *stringToDisplay = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        currentElementValue = [[NSMutableString alloc] initWithString:stringToDisplay];
    } else {
        NSString *stringToDisplay = [string stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        [currentElementValue appendString:stringToDisplay];
    }
}


- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"beers"]) {
        // We reached the end of the XML document
        return;
    }
    if ([elementName isEqualToString:@"beer"] ) {
        // We are done with user entry – add the parsed user
        // object to our user array
        [beer setCategory:@"beer"];
        [beers addObject:beer];
        beer = nil;
        // release user object
    }
    if ([elementName isEqualToString:@"brewery"]){
        beer.brewery = currentElementValue;
    }
    if ([elementName isEqualToString:@"bottling"]){
        beer.bottling = currentElementValue;
    }
    if ([elementName isEqualToString:@"place"]){
        beer.place = currentElementValue;
    }
    if ([elementName isEqualToString:@"type"]){
        beer.type = currentElementValue;
    }
    if ([elementName isEqualToString:@"price"]){
        beer.price = currentElementValue;
    }
    currentElementValue = nil;
    
}


- (NSMutableArray*) doParse:(NSData *)data {
    
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    BeerParser *parser = [[BeerParser alloc] initBeerParser];
    NSMutableArray* burr = [[NSMutableArray alloc]init];
    burr = parser.beers;
    [nsXmlParser setDelegate:parser];
    //NSMutableArray* liq = [[NSMutableArray alloc]init];
    BOOL success = [nsXmlParser parse];
    
    if (success) {
        NSLog(@"No errors - beer count : %i", parser.beers.count);
        
    } else {
        NSLog(@"Error parsing document!");
    }
    
    return burr;
}


@end
