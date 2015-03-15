//
//  ViewController.h
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource> {
    NSFetchedResultsController *fetchedResultsController;
    NSManagedObjectContext *managedObjectContext;

}

@property (nonatomic, retain) NSFetchedResultsController *fetchedResultsController;
@property (nonatomic, retain) NSManagedObjectContext *managedObjectContext;

@property (strong, nonatomic)NSMutableArray *listOfFood;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property NSInteger *foodEaten;
@property NSInteger *garbage;
@property NSMutableArray *collectionData;


@end

