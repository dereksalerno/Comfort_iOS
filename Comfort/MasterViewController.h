//
//  MasterViewController.h
//  Comfort
//
//  Created by Derek Salerno on 1/30/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"

@interface MasterViewController : UITableViewController
{
    NSString *category;
    NSString *wineColor;
    NSString *type;
}
@property(nonatomic, strong)NSManagedObjectContext* managedObjectContext;
@property(nonatomic, strong)NSString* category;
@property(nonatomic, strong)NSString* wineColor;
@property(nonatomic, strong)NSString* type;
@property(nonatomic, strong)NSString* title;
-(NSMutableArray*)getCorrectArray;

@end
