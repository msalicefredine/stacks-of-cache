//
//  PickerViewController.h
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FoodObject.h"

@interface PickerViewController : UIViewController < UIPickerViewDelegate, UIPickerViewDataSource >
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
@property FoodObject *food;
@property BOOL *isSaved;
@end