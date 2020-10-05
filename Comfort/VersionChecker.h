//
//  VersionChecker.h
//  Comfort
//
//  Created by Derek Salerno on 6/18/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Reachability.h"
#import "AppDelegate.h"

@class NSNumber;

@interface VersionChecker : NSObject <NSXMLParserDelegate>{
    NSMutableString *currentElementValue;
}

@property (nonatomic)int xmlVersion;


-(VersionChecker*)initVersionChecker;
//-(BOOL)needsUpdate:(NSData*)localData;
-(void)doParse:(NSData*)data;

@end
