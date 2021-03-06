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
@property (weak, nonatomic) IBOutlet UIPickerView *typeField;
@property (weak, nonatomic) IBOutlet UITextField *foodField;
@property (weak, nonatomic) IBOutlet UIBarButtonItem *saveButton;

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *textFieldHorizontal;
@property (weak, nonatomic) NSDate *expDate;
@property NSInteger *rowIndex;



@end

@implementation PickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    NSArray *data = [[NSArray alloc] initWithObjects: @"Vegetable", @"Fruit", @"Meat", @"Dairy", nil];
    
    self.array = data;
    
    if (self.food != nil) {
        if (self.food.name != nil) {
            self.foodField.text = self.food.name;
        }
        if (*(_rowIndex) != nil) {
        [_typeField selectRow:*(_rowIndex) inComponent:0 animated:YES];
        }
    }
    
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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    self.isSaved = NO;
    NSInteger row = [_typeField selectedRowInComponent:0];
    _rowIndex = &row;
    if (sender != self.saveButton) return;
    if (self.foodField.text.length > 0) {
        self.food = [[FoodObject alloc] init];
        self.food.name = self.foodField.text;
        
        self.food.type = [_array objectAtIndex:row];
        self.food.expiry = self.expDate;

    }
    
    // If date is nil, set default expiry based on food type
    if (self.food.expiry == nil) {
        switch (row) {
            // Vegetables - 1 week
            case 0:
                self.food.expiry = [NSDate dateWithTimeIntervalSinceNow:30240];
                break;
            // Fruit - 1 week
            case 1:
                self.food.expiry = [NSDate dateWithTimeIntervalSinceNow:30240];
                break;
            // Meat - 3 Days
            case 2:
                self.food.expiry = [NSDate dateWithTimeIntervalSinceNow:12960];
                break;
            // Dairy - 5 Days
            case 3:
                self.food.expiry = [NSDate dateWithTimeIntervalSinceNow:43200];
                break;
                
            default:
                self.food.expiry = [NSDate date];
                break;
        }
    }
    self.isSaved = YES;
    
    if (self.food.name == nil || self.food.type == nil) {
        self.food = nil;

    }
}

- (IBAction)unwindToAddFood:(UIStoryboardSegue *)segue {
    
    DatePickerViewController *source = [segue sourceViewController];
    
    NSDate *item = source.date;
    
    if (item != nil) {
        self.expDate = item;
    }
    
    else {
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                           message:@"Expiry date must be at least one day in advance."
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [theAlert show];
    }
    
}

@end