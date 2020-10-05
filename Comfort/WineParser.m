//
//  WineParser.m
//  Comfort
//
//  Created by Derek Salerno on 2/3/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "WineParser.h"
#import "Wine.h"

@implementation WineParser
@synthesize wine, wines, currentElementValue;

-(WineParser*) initWineParser{
    wines = [[NSMutableArray alloc] init];
    return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	
    if ([elementName isEqualToString:@"wine"]) {
        //NSMutableString* currentElementValue = [[NSMutableString alloc]init];
        wine = [[Wine alloc] init];
    }
}

- (void)parser:(NSXMLParser *)parser foundCharacters:(NSString *)string {
//    
    if (!currentElementValue){
        currentElementValue = [[NSMutableString alloc]initWithString:string];
    }else{
    [self.currentElementValue appendString:string];
    //NSLog(@"Current Element Value: %@", string);
    }
}


- (void)parser:(NSXMLParser *)parser
 didEndElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qName {
    
    if ([elementName isEqualToString:@"wines"]) {
        // We reached the end of the XML document
        return;
    }
    if ([elementName isEqualToString:@"wine"] ) {
        // We are done with user entry – add the parsed user
        [wine setCategory:@"wine"];
        [wines addObject:wine];
        wine = nil;
        // release wine object
    }
    if ([elementName isEqualToString:@"winery"]){
           NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.winery = elementToPost;
    }
    if ([elementName isEqualToString:@"bottling"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.bottling = elementToPost;
        //wine.hasBottling = YES;
    }
    if ([elementName isEqualToString:@"category"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.type = elementToPost;
    }
    if ([elementName isEqualToString:@"color"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.color = elementToPost;
    }
    if ([elementName isEqualToString:@"varietals"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.varietals = elementToPost;
    }
    if ([elementName isEqualToString:@"region"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.region = elementToPost;
    }
    if ([elementName isEqualToString:@"price"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.price = elementToPost;
    }
    if ([elementName isEqualToString:@"country"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.country = elementToPost;
    }
    if ([elementName isEqualToString:@"vintage"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        wine.vintage = elementToPost;
    }
    if ([elementName isEqualToString:@"world"]){
            NSString * elementToPost = [currentElementValue stringByTrimmingCharactersInSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];
        if ([elementToPost isEqualToString:@"Old"]){
            wine.isOldWorld = @YES;
        }
    }

    currentElementValue = nil;
    
}


- (NSMutableArray*) doParse:(NSData *)data {
    
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    
    WineParser *parser = [[WineParser alloc] initWineParser];
    NSMutableArray* vinos = [[NSMutableArray alloc]init];
    vinos = parser.wines;
    [nsXmlParser setDelegate:parser];
    //NSMutableArray* liq = [[NSMutableArray alloc]init];
    BOOL success = [nsXmlParser parse];
    
    if (success) {
        NSLog(@"No errors - wine count : %i", parser.wines.count);
        
    } else {
        NSLog(@"Error parsing document!");
    }
    
    return vinos;
}


@end
