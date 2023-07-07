//
//  QuadraticEquationResult.h
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import <Foundation/Foundation.h>

@interface QuadraticEquationResult : NSObject

@property (assign, nonatomic) double x1;
@property (assign, nonatomic) double x2;

- (instancetype)initWithX1:(double)x1 x2:(double)x2;

@end
