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



@interface ViewController ()

@end

@implementation ViewController{

    NSMutableArray *_collectionData;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listOfFood = [[NSMutableArray array] init];
    _collectionData = [[NSMutableArray array] init];
    //_collectionData = _listOfFood;

    [self loadInitialData];
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



- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    PickerViewController *source = [segue sourceViewController];
    
    FoodObject *item = source.food;
    
    if (item != nil) {
        [self.listOfFood addObject:item];
    }
}

#pragma mark Collection View Methods

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    // only one collection (food in fridge)
    return 1;
}
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return [_collectionData count];
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{

    // creates new cell referencing FoodCell created in storyboard
    UICollectionViewCell *foodCell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FoodCell" forIndexPath:indexPath];

    UILabel *label = (UILabel *)[foodCell viewWithTag:100];
    FoodObject *foodObject = [self->_collectionData objectAtIndex: indexPath.row];
    label.text = foodObject.name;

    [foodCell.layer setCornerRadius:20.0f];

    return foodCell;
}


@end
