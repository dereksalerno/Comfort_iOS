//
//  VersionChecker.m
//  Comfort
//
//  Created by Derek Salerno on 6/18/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "VersionChecker.h"

@implementation VersionChecker
@synthesize xmlVersion;

-(VersionChecker*) initVersionChecker{
    //xmlVersion = [[NSNumber alloc]init];
    
    return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
    if ([elementName isEqualToString:@"listVersion"]){
        //return [NSNumber numberWithInt:[currentElementValue intValue]];
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
    if ([elementName isEqualToString:@"listVersion"]){
        [self setXmlVersion:[currentElementValue intValue]];
        //xmlVersion = [currentElementValue intValue];
        //xmlVersion = [NSNumber numberWithInt:[currentElementValue intValue]];
        //return [NSNumber numberWithInt:[currentElementValue intValue]];
    }
}
    
- (void) doParse:(NSData *)data {
        
        NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
        VersionChecker *vc = [[VersionChecker alloc] initVersionChecker];
        [nsXmlParser setDelegate:vc];
        //xmlVersion = self.xmlVersion;
        
        //NSLog(@"No errors - liquor count : %i", parser.liquors.count);
        BOOL success = [nsXmlParser parse];
        
        if (success) {
            NSLog(@"AAAAA self.xmlVersion: %i", self.xmlVersion);
            NSLog(@"xmlVersion: %i", xmlVersion);
        } else {
            NSLog(@"Error parsing document!");
        }
 
    }

@end
