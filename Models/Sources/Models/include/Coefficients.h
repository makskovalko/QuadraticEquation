//
//  Coefficient.h
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import <Foundation/Foundation.h>

@interface Coefficients : NSObject

@property (assign, nonatomic) double a;
@property (assign, nonatomic) double b;
@property (assign, nonatomic) double c;

- (instancetype)initWithA:(double)a b:(double)b c:(double)c;

@end
