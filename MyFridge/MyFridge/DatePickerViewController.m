//
//  DatePickerViewController.m
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-14.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//
#import "DatePickerViewController.h"

@interface DatePickerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *datePicker;
@property (weak, nonatomic) IBOutlet UIButton *saveButton;

@end

@implementation DatePickerViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
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
    if (sender != self.saveButton) return;
    self.date = self.datePicker.date;
    
    if (self.date == [NSDate date] || [[NSDate date] earlierDate:self.date] == self.date) {
        self.date = nil;
        UIAlertView *theAlert = [[UIAlertView alloc] initWithTitle:@"Error!"
                                                           message:@"Expiry date must be at least one day in advance."
                                                          delegate:self
                                                 cancelButtonTitle:@"OK"
                                                 otherButtonTitles:nil];
        [theAlert show];
    }

}


@end