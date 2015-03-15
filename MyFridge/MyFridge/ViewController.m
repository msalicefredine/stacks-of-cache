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

@interface ViewController () {
}
@end

@implementation ViewController{

    NSMutableArray *_collectionData;

}

- (void)viewDidLoad {
    [super viewDidLoad];
    _collectionData = [[NSMutableArray array] init];
    //[self.collectionView reloadData];
    //self.collectionView.dataSource = _collectionData;
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
    //FoodObject *item3 = [[FoodObject alloc] init];
    //item3.name = @"Beets";
    //[self->_collectionData addObject:item3];
}



- (IBAction)unwindToHome:(UIStoryboardSegue *)segue {
    
    PickerViewController *source = [segue sourceViewController];
    
    FoodObject *item = source.food;
    NSLog(@"%@", item.name);
    NSLog(@"returning from segue");
    
    if (item != nil) {
        [self->_collectionData addObject:item];
        NSInteger size = [_collectionData count];
        NSLog(@"CollectionData size: %lu", size);
        NSLog(@"Item added to list.");
        [self.collectionView reloadData];
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
    label.text = foodObject.name;
    //label.minimumFontSize = 8.;
    label.adjustsFontSizeToFitWidth = YES;
    foodCell.tag = [_collectionData count] - 1;

    [foodCell.layer setCornerRadius:20.0f];

    return foodCell;
}

- (IBAction)selectFood1:(id)sender {

    UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Food"
                                                       message:@"Expiry date soon"
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
    [theAlert show];
}

@end
