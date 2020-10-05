//
//  MasterViewController.m
//  Comfort
//
//  Created by Derek Salerno on 1/30/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "BeerParser.h"
#import "Liquor.h"
#import "LiquorParser.h"
#import "Wine.h"
#import "WineParser.h"
#import "AppDelegate.h"
#import "ClarendonLabel.h"


@interface MasterViewController () {
    NSMutableArray *_objects;
}
@end

@implementation MasterViewController
@synthesize type, category, wineColor, title, managedObjectContext;
NSMutableArray *tmpItems;


- (void)awakeFromNib
{
    [super awakeFromNib];
}

-(id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
    
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [AppDelegate comfortColor];
    tmpItems = [[NSMutableArray alloc]initWithArray:self.getCorrectArray];
    self.navigationItem.title = title;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
        return [tmpItems count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell;
    static NSString *cellIdentifier = @"Cell";
    
    if ([self.category isEqualToString:@"wine"])  {
        Wine *wine;
        wine = tmpItems[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if ((![wine.notes length] ==0) && (wine.rating)){
            [cell.textLabel setTextColor:[UIColor redColor]];
        }
        else{
            [cell.textLabel setTextColor:[UIColor blackColor]];
        }
        cell.textLabel.font = [UIFont fontWithName:@"Clarendon BT" size:20.0];
        cell.textLabel.text = [wine description];
        //label.text = [wine description];
        if (wine.isOldWorld){
            cell.detailTextLabel.text = [wine region];}
            else{cell.detailTextLabel.text = [wine varietals];
                
            }
    }
    if ([self.category isEqualToString:@"beer"])  {
        Beer *beer;
        beer = tmpItems[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if ((![beer.notes length] ==0) && (beer.rating)){
            [cell.textLabel setTextColor:[UIColor redColor]];
        }
        else{
            [cell.textLabel setTextColor:[UIColor blackColor]];
        }
        cell.textLabel.font = [UIFont fontWithName:@"Clarendon BT" size:20.0];
        cell.textLabel.text = [beer brewery];
        if (beer.bottling){
        cell.detailTextLabel.text = [beer bottling];
        }else{cell.detailTextLabel.text = @"";
        
        }
    }
    
    if ([self.category isEqualToString:@"liquor"])  {
        Liquor *liquor;
        liquor = tmpItems[indexPath.row];
        cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
        if ((![liquor.notes length] ==0) && (liquor.rating)){
            [cell.textLabel setTextColor:[UIColor redColor]];
        }
        else{
            [cell.textLabel setTextColor:[UIColor blackColor]];
        }
        cell.textLabel.font = [UIFont fontWithName:@"Clarendon BT" size:20.0];
        cell.textLabel.text = [liquor distiller];
        if (liquor.bottling){
            cell.detailTextLabel.text = [liquor subtitleDescription];
        }else if (!(liquor.bottling)&&(liquor.age)){
            cell.detailTextLabel.text = [liquor age];
        }
        
        else{cell.detailTextLabel.text = @"";
        
    }
}
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
      
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        id object = [tmpItems objectAtIndex:indexPath.row];
        [[segue destinationViewController] setCategory:self.category];
        [[segue destinationViewController] setDetailItem:object];
        
    }
}



-(NSMutableArray*)getCorrectArray{
    AppDelegate* appDelegate = (AppDelegate*)[[UIApplication sharedApplication] delegate];
    NSFetchRequest* fetchRequest = [[NSFetchRequest alloc] init];
    NSMutableArray* tmpArray;
    NSError* error;
    managedObjectContext = appDelegate.managedObjectContext;
    NSEntityDescription* entityDescription;
    NSPredicate* predicate;
    
        if ([self.category isEqualToString:@"beer"]){
            predicate = [NSPredicate predicateWithFormat:@"(type like[cd] %@)", type];
            [fetchRequest setPredicate:predicate];
            entityDescription =[NSEntityDescription entityForName:@"Beer"
                                              inManagedObjectContext:managedObjectContext];
            [fetchRequest setEntity:entityDescription];
            NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
            
        tmpArray = [[NSMutableArray alloc]init];
        tmpArray = (NSMutableArray*)array;
    }
    if ([self.category isEqualToString:@"wine"]){
        predicate = [NSPredicate predicateWithFormat:@"(type like[cd] %@) AND (color like[cd] %@)", type, wineColor];
        [fetchRequest setPredicate:predicate];
        entityDescription =[NSEntityDescription entityForName:@"Wine"
                                                          inManagedObjectContext:managedObjectContext];
        [fetchRequest setEntity:entityDescription];
        NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        tmpArray = [[NSMutableArray alloc]init];
        tmpArray = (NSMutableArray*)array;
        for (Wine *wine in tmpArray){
            if (![wine.color isEqualToString:wineColor])
                [tmpArray removeObject:wine];
        }
    }
    if ([self.category isEqualToString:@"liquor"]){
            predicate = [NSPredicate predicateWithFormat:@"(type like[cd] %@)", type];
            [fetchRequest setPredicate:predicate];
            entityDescription =[NSEntityDescription entityForName:@"Liquor"
                                                              inManagedObjectContext:managedObjectContext];
            [fetchRequest setEntity:entityDescription];
            NSError* error;
            NSArray *array = [managedObjectContext executeFetchRequest:fetchRequest error:&error];
        tmpArray = [[NSMutableArray alloc]init];
        tmpArray = (NSMutableArray*)array;
    }
    return tmpArray;
}


@end
