//
//  NotesViewController.m
//  Comfort
//
//  Created by Derek Salerno on 3/14/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "NotesViewController.h"

@interface NotesViewController ()

@end

@implementation NotesViewController
@synthesize notesTextView, notesItem, notesLabel, itemCategory,ratingLabel, ratingSlider, beer, wine, liquor, managedObjectContext, tweetButton;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIImage* sliderBarImage = [UIImage imageNamed:@"slider_bar_comfort.png"];
    sliderBarImage = [sliderBarImage stretchableImageWithLeftCapWidth:8.0 topCapHeight:0.0];
    self.view.backgroundColor = [AppDelegate comfortColor];
    self.notesTextView.backgroundColor = [AppDelegate off_white];
    self.notesTextView.clipsToBounds = YES;
    [[self notesLabel]setTextAlignment:NSTextAlignmentCenter];
    [[self ratingLabel]setTextAlignment:NSTextAlignmentCenter];
    [[self ratingLabel] setText:[NSString stringWithFormat:@"%.01f/5", ratingSlider.value]];
    self.notesTextView.layer.cornerRadius = 10.0f;
    self.notesTextView.text = [self getNotes];

    
    //self.ratingSlider.value = [[self getRating] floatValue];
    [ratingSlider setMinimumTrackImage:sliderBarImage forState:UIControlStateNormal];
    [ratingSlider setMaximumTrackImage:sliderBarImage forState:UIControlStateNormal];
    ratingSlider.continuous = YES;
    ratingSlider.maximumValue = 5.0f;
    [ratingSlider addTarget:self
                     action:@selector(sliderValueChanged:)
           forControlEvents:UIControlEventValueChanged];
    UIImage* tweetImage = [UIImage imageNamed:@"twitter-bird-blue-on-yellow.png"];
    
    [tweetButton setBackgroundImage:tweetImage forState:UIControlStateNormal];
    tweetButton.frame =CGRectMake(86.0f, 542.0f, 44.0f, 44.0f);
    [self configureView];
	// Do any additional setup after loading the view.
}

- (void)configureView
{
    // Update the user interface for the detail item.
    
    if (self.beer) {
        [self.ratingSlider setValue:[[self.beer rating] floatValue] animated:NO];
        [[self ratingLabel] setText:[NSString stringWithFormat:@"%.01f/5", [[self.beer rating] floatValue]]];
        self.notesLabel.text = [self.beer description];
    }
    if (self.liquor) {
        [self.ratingSlider setValue:[[self.liquor rating] floatValue] animated:NO];
        [[self ratingLabel] setText:[NSString stringWithFormat:@"%.01f/5", [[self.liquor rating] floatValue]]];
        self.notesLabel.text = [self.liquor description];
    }
    if (self.wine) {
        [self.ratingSlider setValue:[[self.wine rating] floatValue] animated:NO];
        [[self ratingLabel] setText:[NSString stringWithFormat:@"%.01f/5", [[self.wine rating] floatValue]]];
        self.notesLabel.text = [self.wine description];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    [self setNotesTextView:nil];
    [self setNotesLabel:nil];
    [self setRatingSlider:nil];
    [self setRatingLabel:nil];
    [super viewDidUnload];
}

- (IBAction)dismissKeyboard:(id)sender {
    [notesTextView resignFirstResponder];
    
}
    

- (IBAction)sliderValueChanged:(UISlider*)sender {
    
    [[self ratingLabel] setText:[NSString stringWithFormat:@"%.01f/5", sender.value]];
}

- (IBAction)saveNotes:(id)sender {
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    managedObjectContext = appDelegate.managedObjectContext;
    NSError* error;
    
    if ([self.itemCategory isEqualToString:@"beer"]){
        NSManagedObjectID * beerID = [beer objectID];
        beer = (Beer*)[managedObjectContext existingObjectWithID:beerID error:&error];
        beer.notes = [notesTextView text];
        beer.rating = [NSNumber numberWithFloat:[ratingSlider value]];
    
        if (![managedObjectContext save:&error]) {
            NSLog(@"Failed to save - error: %@", [error localizedDescription]);
        }
    }
    if ([self.itemCategory isEqualToString:@"liquor"]){
        NSManagedObjectID * liquorID = [liquor objectID];
        NSLog(@"MAnaged Object ID: %@", liquorID);
        liquor = (Liquor*)[managedObjectContext existingObjectWithID:liquorID error:&error];
        liquor.notes = [notesTextView text];
        liquor.rating = [NSNumber numberWithFloat:[ratingSlider value]];
        
        if (![managedObjectContext save:&error]) {
            NSLog(@"Failed to save - error: %@", [error localizedDescription]);
        }
    }
    if ([self.itemCategory isEqualToString:@"wine"]){
        NSManagedObjectID * wineID = [wine objectID];
        wine = (Wine*)[managedObjectContext existingObjectWithID:wineID error:&error];
        wine.notes = [notesTextView text];
        wine.rating = [NSNumber numberWithFloat:[ratingSlider value]];
        
        if (![managedObjectContext save:&error]) {
            NSLog(@"Failed to save - error: %@", [error localizedDescription]);
        }
    }
}
-(NSString*)getNotes{
    NSString * tmpString;
    if ((self.beer) && (self.beer.notes)){
        tmpString = self.beer.notes;
    }
    if ((self.liquor) && (self.liquor.notes)){
        tmpString = liquor.notes;
    }
    if ((self.wine) && (self.wine.notes)){
        tmpString = self.wine.notes;
    }
    return tmpString;
}



-(NSNumber*)getRating{
    NSNumber * tmpNumber;
    if ((self.beer) && (self.beer.rating)){
        tmpNumber = self.beer.rating;
    }
    if ((self.liquor) && (self.liquor.rating)){
        tmpNumber = self.liquor.rating;
    }
    if ((self.wine) && (self.wine.rating)){
        tmpNumber = self.wine.rating;
    }
    return tmpNumber;
}

@end
