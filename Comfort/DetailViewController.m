//
//  DetailViewController.m
//  Comfort
//
//  Created by Derek Salerno on 1/30/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "DetailViewController.h"




@interface DetailViewController ()
- (void)configureView;
@end

@implementation DetailViewController
@synthesize detailItem, detailDescriptionLabel, category;
#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (detailItem != newDetailItem) {
        detailItem = newDetailItem;
        if ([self.category isEqualToString:@"beer"]){
            //Beer* beer = (Beer*)detailItem;
            detailItem = (Beer*)detailItem;
        }
        if ([self.category isEqualToString:@"liquor"]){
            detailItem = (Liquor*)detailItem;
        }
        if ([self.category isEqualToString:@"wine"]){
            detailItem = (Wine*)detailItem;
        }
        
        [self configureView];
    }
}

- (void)configureView
{
    // Update the user interface for the detail item.

    if (self.detailItem) {
        self.detailDescriptionLabel.text = [self.detailItem detailString];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [AppDelegate comfortColor];
    self.detailDescriptionLabel.backgroundColor = [AppDelegate comfortColor];
    self.detailDescriptionLabel.textAlignment=UITextAlignmentLeft;
    self.navigationItem.title = [self.detailItem description];
    [self configureView];
}

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showNotes"]) {
        
        if ([detailItem isMemberOfClass:[Beer class]]){
            [[segue destinationViewController] setItemCategory:@"beer"];
            [[segue destinationViewController] setBeer:detailItem];
        }
        
        if ([detailItem isMemberOfClass:[Liquor class]]){
            [[segue destinationViewController] setItemCategory:@"liquor"];
            [[segue destinationViewController] setLiquor:detailItem];
        }
        if ([detailItem isMemberOfClass:[Wine class]]){
            [[segue destinationViewController] setItemCategory:@"wine"];
            [[segue destinationViewController] setWine:detailItem];
        }
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
