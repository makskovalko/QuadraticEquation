//
//  AlertInfo.m
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import "AlertInfo.h"

@implementation AlertInfo

-(instancetype)initWithMessage:(NSString *)message
               informativeText:(NSString *)informativeText {
    if (self = [super init]) {
        self.message = message;
        self.informativeText = informativeText;
    }
    return self;
}

@end
