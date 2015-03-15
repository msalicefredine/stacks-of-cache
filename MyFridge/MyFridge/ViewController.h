//
//  ViewController.h
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>

@property (strong, nonatomic)NSMutableArray *listOfFood;

@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;

@end

