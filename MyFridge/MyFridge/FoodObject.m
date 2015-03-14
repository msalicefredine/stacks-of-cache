//
//  FoodObject.m
//  MyFridge
//
//  Created by Alice Fredine on 2015-03-14.
//  Copyright (c) 2015 Alice Fredine. All rights reserved.
//

#import "FoodObject.h"

@interface FoodObject ()

@end

@implementation FoodObject

-(id)initWithFieldsType:(NSString *)type name:(NSString *)name date:(NSDate *)expiry {
    self = [super init];
    self.expiry = expiry;
    self.type = type;
    self.name = name;
	self.alert = NULL;
    return self;
}

@end
