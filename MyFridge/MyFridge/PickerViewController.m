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

#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
    self.isSaved = NO;
    NSInteger row = [_typeField selectedRowInComponent:0];
    if (sender != self.saveButton) return;
    if (self.foodField.text.length > 0) {
        NSLog(@"Segue being prepared and setting foodObject fields.");
        self.food = [[FoodObject alloc] init];
        self.food.name = self.foodField.text;
        
        self.food.type = [_array objectAtIndex:row];
        self.food.expiry = self.expDate;

    }
    self.isSaved = YES;
    
    if (self.food.name == nil || self.food.type == nil) {
        self.food = nil;

    }
}

- (IBAction)unwindToAddFood:(UIStoryboardSegue *)segue {
    
    DatePickerViewController *source = [segue sourceViewController];
    
    NSDate *item = source.date;
    NSLog(@"Return from Date Segue");
    
    if (item != nil) {
        self.expDate = item;
        NSLog(@"Date set.");
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