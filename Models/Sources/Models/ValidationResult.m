//
//  ValidationResult.m
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import "ValidationResult.h"

@implementation ValidationResult

-(instancetype)initWithAValue:(double)aValue
                       bValue:(double)bValue
                       cValue:(double)cValue {
    if (self = [super init]) {
        self.aValue = aValue;
        self.bValue = bValue;
        self.cValue = cValue;
    }
    return self;
}

@end
