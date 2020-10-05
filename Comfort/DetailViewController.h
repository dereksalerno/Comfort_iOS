//
//  DetailViewController.h
//  Comfort
//
//  Created by Derek Salerno on 1/30/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Beer.h"
#import "AppDelegate.h"
#import "MasterViewController.h"
#import "NotesViewController.h"

@interface DetailViewController : UIViewController

@property (strong, nonatomic) id detailItem;
@property (strong, nonatomic)NSString* category;
@property (weak, nonatomic) IBOutlet UILabel *detailDescriptionLabel;


@end
