//
//  AppDelegate.h
//  Comfort
//
//  Created by Derek Salerno on 1/30/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NotesViewController.h"
#import "Parser.h"
#import "VersionChecker.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>

//c+p from boilerplate code

@property (nonatomic, strong)NSNumber* webXMLVersion;
@property (nonatomic, strong)NSNumber* localXMLVersion;
@property (readonly, strong, nonatomic) NSManagedObjectContext *managedObjectContext;
@property (readonly, strong, nonatomic) NSManagedObjectModel *managedObjectModel;
@property (readonly, strong, nonatomic) NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

//end c+p


+(UIColor*)comfortColor;
+(UIColor*)brownish;
+(UIColor*)off_white;

@property (strong, nonatomic) UIWindow *window;

@end
