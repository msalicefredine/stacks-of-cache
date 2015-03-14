//
//  PickerViewController.m
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import "PickerViewController.h"

@interface PickerViewController ()

@property (strong, nonatomic) NSArray *array;

@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *data = [[NSArray alloc] initWithObjects: @"Vegetable", @"Fruit", @"Meat", @"Dairy", nil];
    
    self.array = data;
    
    // Do any additional setup after loading the view, typically from a nib.
}

#pragma mark Picker Data Source Methods

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView {
    return 1;
}

-(NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component {
    return [_array count];
}

#pragma mark Picker Delegate Methods

-(NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component {
    return [_array objectAtIndex:row];
}



- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)buttonPressed:(id)sender {
    NSString *select = [_array objectAtIndex:[_picker selectedRowInComponent:0]];
    NSString *title = [[NSString alloc] initWithFormat:@"Food Type: %@", select];
    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:title message: @"Yay!" delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil];
    [alert show];
    
}

@end