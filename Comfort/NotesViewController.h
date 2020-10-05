//
//  NotesViewController.h
//  Comfort
//
//  Created by Derek Salerno on 3/14/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>
#import "AppDelegate.h"
#import <QuartzCore/QuartzCore.h>
#import "Liquor.h"
#import "Beer.h"
#import "Wine.h"
#import "ClarendonLabel.h"

@interface NotesViewController : UIViewController

@property (weak, nonatomic) IBOutlet UILabel *notesLabel;
@property (weak, nonatomic) IBOutlet UITextView *notesTextView;
@property (strong, nonatomic) id notesItem;
@property (strong, nonatomic) NSString* itemCategory;
@property (strong, nonatomic) Beer* beer;
@property (strong, nonatomic) Wine* wine;
@property (strong, nonatomic) Liquor* liquor;
@property (weak, nonatomic) IBOutlet ClarendonLabel *ratingLabel;
@property (weak, nonatomic) IBOutlet UISlider *ratingSlider;
@property (nonatomic,strong) NSManagedObjectContext* managedObjectContext;
@property (weak, nonatomic) IBOutlet UIButton *tweetButton;


- (IBAction)dismissKeyboard:(id)sender;
- (IBAction)sliderValueChanged:(id)sender;
- (IBAction)saveNotes:(id)sender;

-(NSString*)getNotes;
-(NSNumber*)getRating;




@end
