//
//  Coefficient.m
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import "include/Coefficients.h"

@implementation Coefficients

-(instancetype)initWithA:(double)a b:(double)b c:(double)c {
    if (self = [super init]) {
        self.a = a;
        self.b = b;
        self.c = c;
    }
    return self;
}

@end
