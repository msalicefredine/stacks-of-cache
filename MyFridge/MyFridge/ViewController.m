//
//  ViewController.m
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import "ViewController.h"
#import "FoodObject.h"
#import "PickerViewController.h"
@import UIKit;

@interface ViewController () {
}
@end

@implementation ViewController
@synthesize fetchedResultsController, managedObjectContext;
    
- (NSManagedObjectContext *)managedObjectContext {
    NSManagedObjectContext *context = nil;
    id delegate = [[UIApplication sharedApplication] delegate];
    if ([delegate performSelector:@selector(managedObjectContext)]) {
        context = [delegate managedObjectContext];
    }
    return context;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
    // Fetch the devices from persistent data store
    NSManagedObjectContext *managedObjectContext = [self managedObjectContext];
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] initWithEntityName:@"Food"];
    self.collectionData = [[managedObjectContext executeFetchRequest:fetchRequest error:nil] mutableCopy];
    
    [self.collectionView reloadData];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _collectionData = [[NSMutableArray array] init];
    [self.collectionView reloadData];
    //[self loadInitialData];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


// fake data
- (void)loadInitialData {
    FoodObject *item1 = [[FoodObject alloc] init];
    item1.name = @"Brocolli";
    [self->_collectionData addObject:item1];
    FoodObject *item2 = [[FoodObject alloc] init];
    item2.name = @"Eggs";
    [self->_collectionData addObject:item2];
    FoodObject *item3 = [[FoodObject alloc] init];
    item3.name = @"Beets";
    [self->_collectionData addObject:item3];
}


- (IBAction)unwindToHome:(UIStoryboardSegue *)segue {
    
    PickerViewController *source = [segue sourceViewController];
    
    FoodObject *item = source.food;
    
    if (item != nil) {
        
        
        // Set up a notification for the item
        UILocalNotification *notification = [[UILocalNotification alloc] init];
        
        NSTimeInterval timeInterval = [item.expiry timeIntervalSinceNow] * 0.8;
        NSDate *notifyDate = [item.expiry dateByAddingTimeInterval:timeInterval];
        
        notification.fireDate = notifyDate;
        NSString *message = [NSString stringWithFormat:@"Your %@ expires soon. Eat it today!", item.name];
        notification.alertBody = message;
        notification.alertAction = @"OK";
        item.alert = notification;
        
        // Set up the item in persistent data
        
        NSManagedObjectContext *context = [self managedObjectContext];
        
        // Create a new managed object
        NSManagedObject *newFood = [NSEntityDescription insertNewObjectForEntityForName:@"Food" inManagedObjectContext:context];
        [newFood setValue:item.name forKey:@"name"];
        [newFood setValue:item.type forKey:@"type"];
        [newFood setValue:item.expiry forKey:@"expiry"];
        
        NSError *error = nil;
        // Save the object to persistent store
        if (![context save:&error]) {
            NSLog(@"Can't Save! %@ %@", error, [error localizedDescription]);
        }
        
        [self dismissViewControllerAnimated:YES completion:nil];
        
        [self->_collectionData addObject:item];
        [self.collectionView reloadData];
        
        [[UIApplication sharedApplication] scheduleLocalNotification:notification];
        
    }
    
    else if (source.isSaved){
    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                       message:@"Could not be saved."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
    }
}

#pragma mark Collection View Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    // only one collection (food in fridge)
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {

    return [_collectionData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{


    UICollectionViewCell *foodCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FoodCell" forIndexPath:indexPath];

    UILabel *label = (UILabel *)[foodCell viewWithTag:100];
    FoodObject *foodObject = [self->_collectionData objectAtIndex: indexPath.row];
    label.text = [NSString stringWithFormat:@"%@\n%@\nExpires:\n%@", foodObject.name, foodObject.type, foodObject.expiry];

    [foodCell.layer setCornerRadius:20.0f];

    return foodCell;
}

@end
