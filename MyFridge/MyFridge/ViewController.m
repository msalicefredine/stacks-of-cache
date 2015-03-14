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


- (IBAction)unwindToHome:(UIStoryboardSegue *)segue {
    
    PickerViewController *source = [segue sourceViewController];
    
    FoodObject *item = source.food;
    
    
    if (item != nil) {
        [self.listOfFood addObject:item];
        NSLog(@"This ran");
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

@end
