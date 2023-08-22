//
//  Person+Group.h
//  MMOne
//
//  Created by kevin wan on 2023/8/21.
//

#import "Person.h"

NS_ASSUME_NONNULL_BEGIN

@interface Person (Group)
/// category
@property (nonatomic, copy) NSString *group;

- (void)printGroup;

@end

NS_ASSUME_NONNULL_END
