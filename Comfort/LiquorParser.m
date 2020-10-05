//
//  LiquorParser.m
//  Comfort
//
//  Created by Derek Salerno on 2/1/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "LiquorParser.h"
#import "Liquor.h"

@implementation LiquorParser 

@synthesize liquor, liquors, currentElementValue, managedObjectContext;


-(LiquorParser*) initLiquorParser{
    liquors = [[NSMutableArray alloc] init];
    return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"liquor"]) {
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        managedObjectContext = appDelegate.managedObjectContext;
        liquor = (Liquor*)[NSEntityDescription
                           insertNewObjectForEntityForName:@"Liquor"
                           inManagedObjectContext:managedObjectContext];
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
    
    if ([elementName isEqualToString:@"liquors"]) {
        // We reached the end of the XML document
        return;
    }
    if ([elementName isEqualToString:@"liquor"] ) {
        [liquor setCategory:@"liquor"];
        NSError* error = nil;

        if (![managedObjectContext save:&error]) {
            NSLog(@"Failed to save - error: %@", [error localizedDescription]);
        }

        //[liquors addObject:liquor];
        liquor = nil;
        // release user object
    }
   if ([elementName isEqualToString:@"distiller"]){
        liquor.distiller = currentElementValue;
    }
     if ([elementName isEqualToString:@"bottling"]){
        liquor.bottling = currentElementValue;
    }
     if ([elementName isEqualToString:@"type"]){
         liquor.type = currentElementValue;
    }
     if ([elementName isEqualToString:@"age"]){
         liquor.age = currentElementValue;
    }
     if ([elementName isEqualToString:@"proof"]){
        liquor.proof = currentElementValue;
    }
     if ([elementName isEqualToString:@"price"]){
        liquor.price = currentElementValue;
    }
     if ([elementName isEqualToString:@"place"]){
        liquor.place = currentElementValue;
    }
    currentElementValue = nil;
     
}


- (NSMutableArray*) doParse:(NSData *)data {
    
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    LiquorParser *parser = [[LiquorParser alloc] initLiquorParser];
    NSMutableArray* liq = [[NSMutableArray alloc]init];
    liq = parser.liquors;
    [nsXmlParser setDelegate:parser];
    BOOL success = [nsXmlParser parse];
    
    if (success) {
        NSLog(@"No errors - liquor count : %i", parser.liquors.count);
        
    } else {
        NSLog(@"Error parsing document!");
    }

    return liq;
}

   

@end
