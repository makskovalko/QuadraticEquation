//
//  AlertInfo.h
//  
//
//  Created by Maxim Kovalko on 7/7/23.
//

#import <Foundation/Foundation.h>

@interface AlertInfo : NSObject

@property (strong, nonatomic) NSString *message;
@property (strong, nonatomic) NSString *informativeText;

- (instancetype)initWithMessage:(NSString *)message
                informativeText:(NSString *)informativeText;

@end
