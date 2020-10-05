//
//  MainViewController.m
//  Comfort
//
//  Created by Derek Salerno on 1/31/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "ClarendonButton.h"
#import "Liquor.h"
#import "MasterViewController.h"



@interface MainViewController ()

@end

@implementation MainViewController


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
    self.view.backgroundColor = [AppDelegate comfortColor];
    
    
	// Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewDidUnload {
    
    [super viewDidUnload];
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(UIButton*)sender
{
    // Make sure your segue name in storyboard is the same as this line
    
    if ([[segue identifier] isEqualToString:@"showMiscLiquor"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Miscellaneous"];
    }
    if ([[segue identifier] isEqualToString:@"showCocktails"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"cocktail"];
    }
    if ([[segue identifier] isEqualToString:@"showRedBTG"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"wine"];
        [vc setType:@"btg"];
        [vc setWineColor:@"red"];
    }
    if ([[segue identifier] isEqualToString:@"showRedBottle"])
    {
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"wine"];
        [vc setType:@"bottle"];
        [vc setWineColor:@"red"];
    }
    if ([[segue identifier] isEqualToString:@"showWhiteBTG"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"wine"];
        [vc setType:@"btg"];
        [vc setWineColor:@"white"];
    }
    if ([[segue identifier] isEqualToString:@"showWhiteBottle"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"wine"];
        [vc setType:@"bottle"];
        [vc setWineColor:@"white"];
    }
    if ([[segue identifier] isEqualToString:@"showDraft"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"beer"];
        [vc setType:@"Draft"];
    }
    if ([[segue identifier] isEqualToString:@"showMicrobrew"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"beer"];
        [vc setType:@"American Microbrew"];
    }
    if ([[segue identifier] isEqualToString:@"showDomesticBeer"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"beer"];
        [vc setType:@"Domestic"];
    }
    if ([[segue identifier] isEqualToString:@"showImportBeer"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"beer"];
        [vc setType:@"Import"];
    }
    if ([[segue identifier] isEqualToString:@"showBourbon"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Straight Bourbon"];
    }
    if ([[segue identifier] isEqualToString:@"showRye"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"American Rye"];
    }
    if ([[segue identifier] isEqualToString:@"showTennesseeWhiskey"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Tennessee Whiskey"];
    }
    if ([[segue identifier] isEqualToString:@"showWhiteWhiskey"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"White Whiskey"];
    }
    if ([[segue identifier] isEqualToString:@"showWheatWhiskey"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Wheat Whiskey"];
    }
    if ([[segue identifier] isEqualToString:@"showOtherAmericanWhiskey"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Miscellaneous American"];
    }
    if ([[segue identifier] isEqualToString:@"showCanadianWhisky"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Canadian Whisky"];
    }
    if ([[segue identifier] isEqualToString:@"showScotchWhisky"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Scotch Whisky"];
    }
    if ([[segue identifier] isEqualToString:@"showIrishWhiskey"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Irish Whiskey"];
    }
    if ([[segue identifier] isEqualToString:@"showOtherWhiskeys"])
    {
        // Get reference to the destination view controller
        MasterViewController *vc = [segue destinationViewController];
        [vc setTitle:sender.titleLabel.text];
        [vc setCategory:@"liquor"];
        [vc setType:@"Other Whiskeys"];
    }
    
}
- (IBAction)checkForUpdates:(id)sender {
    [Parser checkForUpdate];
    NSLog(@"clicked");
}
@end
