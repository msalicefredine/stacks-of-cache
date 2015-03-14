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

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _listOfFood = [[NSMutableArray array] init];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return _listOfFood.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"Cell";
    
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];
    
    return cell;
}


- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    PickerViewController *source = [segue sourceViewController];
    
    FoodObject *item = source.food;
    
    
    if (item != nil) {
        [self.listOfFood addObject:item];
		
		// I think we might have to do something with but i have no idea what
		UIUserNotificationSettings * currSettings = [[UIApplication application] currentUserNotificationSettings];
		
		UILocalNotification notification = [[UILocalNotification alloc] init];
		notification.fireDate = item.expiry;
		notification.alertBody = @"hi";
		notification.alertTitle = @"yogurt";
		item.alert = &notification;
		[[UIApplication application] scheduleLocalNotification: notification];
		// [[UIApplication application] presentLocalNotificationNow: notification];
		
		
    }

}

@end
