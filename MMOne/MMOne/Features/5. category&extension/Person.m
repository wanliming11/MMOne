//
//  Person.m
//  MMOne
//
//  Created by kevin wan on 2023/8/21.
//

#import "Person.h"

/// Name extension
@interface Person()
@property (nonatomic, copy) NSString *name;

@end

/// age extension
@interface Person()
@property (nonatomic, copy) NSString *age;

@end


@implementation Person

- (instancetype)init
{
    self = [super init];
    if (self) {
        _name = @"kevin";
        _age = @"18";
    }
    return self;
}


@end
