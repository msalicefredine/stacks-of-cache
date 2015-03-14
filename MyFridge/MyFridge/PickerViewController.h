//
//  PickerViewController.h
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PickerViewController : UIViewController < UIPickerViewDelegate, UIPickerViewDataSource >
@property (strong, nonatomic) IBOutlet UIPickerView *picker;
- (IBAction)buttonPressed:(id)sender;
@end