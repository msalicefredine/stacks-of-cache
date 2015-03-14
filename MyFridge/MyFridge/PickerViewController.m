//
//  PickerViewController.m
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-13.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import "PickerViewController.h"
#import "DatePickerViewController.h"

@interface PickerViewController ()

@property (strong, nonatomic) NSArray *array;

@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveFood;
@property (weak, nonatomic) IBOutlet UITextField *foodField;
@property (weak, nonatomic) IBOutlet UIPickerView *typeField;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldHorizontal;
@property (weak, nonatomic) NSDate *date;


@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *data = [[NSArray alloc] initWithObjects: @"Vegetable", @"Fruit", @"Meat", @"Dairy", nil];
    
    self.array = data;
    self.food.expiry = nil;
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    if (sender != self.saveFood) return;
    if (self.foodField.text.length > 0) {
        self.food = [[FoodObject alloc] init];
        self.food.type = self.picker.textInputContextIdentifier;
        self.food.name = self.foodField.text;
        self.food.expiry = self.date;
        
    }
    if (self.food.name == nil || self.food.type == nil) {
        NSLog(@"Food type: %@", self.food.type);
        self.food = nil;
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                       message:@"Could not be saved."
                                                      delegate:self
                                             cancelButtonTitle:@"OK"
                                             otherButtonTitles:nil];
        [theAlert show];

    }
    
    
}

- (IBAction)unwindToList:(UIStoryboardSegue *)segue {
    
    DatePickerViewController *source = [segue sourceViewController];
    
    NSDate *item = source.expiryDate;
    
    if (item != nil) {
        self.date = item;
    }
    
}


@end