//
//  Parser.m
//  Comfort
//
//  Created by Derek Salerno on 4/17/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "Parser.h"

@implementation Parser

@synthesize liquor, beer, wine, liquors, currentElementValue, managedObjectContext, xmlVersion;

-(Parser*) initParser{
    liquors = [[NSMutableArray alloc] init];
    return self;
}

- (void)parser:(NSXMLParser *)parser
didStartElement:(NSString *)elementName
  namespaceURI:(NSString *)namespaceURI
 qualifiedName:(NSString *)qualifiedName
    attributes:(NSDictionary *)attributeDict {
	//see if it's a liquor object to be created
    if ([elementName isEqualToString:@"liquor"]) {
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        managedObjectContext = appDelegate.managedObjectContext;
        liquor = (Liquor*)[NSEntityDescription
                           insertNewObjectForEntityForName:@"Liquor"
                           inManagedObjectContext:managedObjectContext];
    }
    //check for a beer object
    if ([elementName isEqualToString:@"beer"]) {
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        managedObjectContext = appDelegate.managedObjectContext;
        beer = (Beer*)[NSEntityDescription
                       insertNewObjectForEntityForName:@"Beer"
                       inManagedObjectContext:managedObjectContext];
    }
    //look to see if we need a wine object
    if ([elementName isEqualToString:@"wine"]) {
        AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
        
        managedObjectContext = appDelegate.managedObjectContext;
        wine = (Wine*)[NSEntityDescription
                       insertNewObjectForEntityForName:@"Wine"
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
    if ([elementName isEqualToString:@"listVersion"]){
        self.xmlVersion = [NSNumber numberWithInt:[currentElementValue intValue]];
        NSLog(@"%@", currentElementValue);
        NSLog(@"%@", self.xmlVersion);
    }
    
    if (liquor){
        
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
            //liquor.hasBottling = YES;
        }
        if ([elementName isEqualToString:@"type"]){
            if ([currentElementValue isEqualToString:@"cocktail"]){
                liquor.isCocktail = [NSNumber numberWithBool:YES];
            }
            liquor.type = currentElementValue;
        }
        if ([elementName isEqualToString:@"age"]){
            //liquor.hasAge = YES;
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
    
    //check to see if a wine object exists
    else if (wine){
        
        if ([elementName isEqualToString:@"wines"]) {
            // We reached the end of the XML document
            return;
        }
        if ([elementName isEqualToString:@"wine"] ) {
            
            [wine setCategory:@"wine"];
            NSError* error = nil;
            if (![managedObjectContext save:&error]) {
                NSLog(@"Failed to save - error: %@", [error localizedDescription]);
            }
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
                [wine setValue:@YES forKey:@"isOldWorld"];
                //wine.isOldWorld = @YES;
            }
            else [wine setValue:@NO forKey:@"isOldWorld"];
        }
        
        currentElementValue = nil;
        
    }
    else if(beer){
        
        
        if ([elementName isEqualToString:@"beers"]) {
            // We reached the end of the XML document
            return;
        }
        if ([elementName isEqualToString:@"beer"] ) {
            [beer setCategory:@"beer"];
            NSError *error = nil;
            if (![managedObjectContext save:&error]) {
                NSLog(@"Failed to save - error: %@", [error localizedDescription]);
            }
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
}


- (void) doParse:(NSData *)data {
    
    NSXMLParser *nsXmlParser = [[NSXMLParser alloc] initWithData:data];
    Parser *parser = [[Parser alloc] initParser];
    [nsXmlParser setDelegate:parser];
    BOOL success = [nsXmlParser parse];
    
    if (success) {
        
    } else {
        NSLog(@"Error parsing document!");
    }
}

+(void)checkForUpdate{
    
    //Check the network status!
    Reachability *networkReachability = [Reachability reachabilityForInternetConnection];
    NetworkStatus networkStatus = [networkReachability currentReachabilityStatus];
    BOOL networkIsAvailable;
    if (networkStatus == NotReachable){
        networkIsAvailable = NO;
        NSLog(@"Network is not available");
    }
    else {
        networkIsAvailable = YES;
        NSLog(@"Network is available");
    }
    // Check network and fetch the updated xml file
    if (networkIsAvailable){
    NSString* filePath = @"https://dl.dropboxusercontent.com/u/37475053/comfort_bar.xml";
    NSString* fetchedData  = [NSString stringWithContentsOfURL:[NSURL URLWithString:filePath] encoding:NSUTF8StringEncoding error:nil];
        NSData *overwriteData = [fetchedData dataUsingEncoding:NSUTF8StringEncoding];
    NSError* error;
    NSString *localXmlPath = [[NSBundle mainBundle] pathForResource:@"comfort_bar" ofType:@"xml"];
    NSDictionary *localXmlDictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:localXmlPath error:&error];
    NSDate* localFileDate = [localXmlDictionary objectForKey:NSFileModificationDate];
        
   if ([[NSFileManager defaultManager] fileExistsAtPath:filePath]){
        NSDictionary *dictionary = [[NSFileManager defaultManager] attributesOfItemAtPath:filePath error:&error];
        NSDate *fileDate =[dictionary objectForKey:NSFileModificationDate];
        if ([fileDate compare:localFileDate] == NSOrderedDescending) {
            NSURL * url = [[NSURL alloc] initFileURLWithPath:filePath];
            NSData* overwriteData = [[NSData alloc] initWithContentsOfURL:url];
            [overwriteData writeToFile:localXmlPath atomically:YES];
            
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"List has been updated!"
                                                            message:@"Your list is now at the current version."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            NSLog(@"Should be showing list has been updated");
            [alert show];
        }
        else{
            UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"List is up to date!"
                                                            message:@"Your list is at the current version."
                                                           delegate:nil
                                                  cancelButtonTitle:@"OK"
                                                  otherButtonTitles:nil];
            NSLog(@"Should be showing list is up to date");
            [alert show];
            }
        }
    else{
        NSLog(@"File doesn't exist at path");
    }
    }
    else {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Unable to connect!"
                                                        message:@"Try again when the network is available."
                                                       delegate:nil
                                              cancelButtonTitle:@"OK"
                                              otherButtonTitles:nil];
        NSLog(@"Should be showing unable to connect");
        [alert show];
    }
 }









@end
