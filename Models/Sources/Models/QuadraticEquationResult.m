//
//  QuadraticEquationResult.m
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import "QuadraticEquationResult.h"

@implementation QuadraticEquationResult

-(instancetype)initWithX1:(double)x1 x2:(double)x2 {
    if (self = [super init]) {
        self.x1 = x1;
        self.x2 = x2;
    }
    return self;
}

@end
