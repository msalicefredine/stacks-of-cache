//
//  FoodObject.h
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-14.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import <Foundation/Foundation.h>
@import UIKit;

@interface FoodObject : NSObject

@property (strong, nonatomic) NSString *type;
@property (strong, nonatomic) NSString *name;
@property (strong, nonatomic) NSDate *expiry;
@property (strong, nonatomic) UILocalNotification *alert;

-(id)initWithFieldsType: (NSString *)type name:(NSString *)name date:(NSDate *)expiry;

@end
