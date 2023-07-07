//
//  ValidationResult.h
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import <Foundation/Foundation.h>

@interface ValidationResult : NSObject

@property (assign, nonatomic) double aValue;
@property (assign, nonatomic) double bValue;
@property (assign, nonatomic) double cValue;

- (instancetype)initWithAValue:(double)aValue
                        bValue:(double)bValue
                        cValue:(double)cValue;

@end
