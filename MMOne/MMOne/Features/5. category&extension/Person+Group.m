//
//  Person+Group.m
//  MMOne
//
//  Created by kevin wan on 2023/8/21.
//

#import "Person+Group.h"
#import <objc/runtime.h>

@implementation Person (Group)

- (void)setGroup:(NSString *)group {
    objc_setAssociatedObject(self, @selector(group), group, OBJC_ASSOCIATION_COPY_NONATOMIC);
}

- (NSString *)group {
    return objc_getAssociatedObject(self, @selector(group));
}

- (void)printGroup {
    self.group = @"mimi";
    NSLog(@"group is %@", self.group);
}


@end
