//
//  BlockIn.m
//  MMOne
//
//  Created by kevin wan on 2023/12/5.
//

#import "BlockIn.h"


@implementation BlockIn

// 1. 闭包和 Block 一种传递操作行为的手段，都可以以一种类似函数的方式进行传递和调用，只是 OC 是以一种显示的函数前面的方式来进行记录，Swift 则可以自动推导，但最终的调用方式类似，无论是 OC 还是 Swift 都可以把 Block 作为一个返回或者输入。
// 2. 对结构体变量的 Control，OC 是通过 __block 来进行的，Swift 是通过 inout 来进行的。
// 3. 逃逸与非逃逸， OC 是通过 __strong 来进行的，Swift 是通过 @escaping 来进行的，建立了一个指针。默认 OC 是逃逸的。
// 4.嵌套函数，OC 不支持，Swift 支持，里面同样需要考虑变量的逃逸和非逃逸问题。逃逸是指超出当前函数的作用域后，闭包依然会继续执行。
// 5. Recycle-reference __weak, [weak self]

typedef int(^returnBlock)(int);


- (returnBlock) testBlockIn {
    __block int value = 12;
    __typeof__(self) weakSelf = self;
    int (^myBlock)(int) = ^(int num) {
        __strong __typeof__(weakSelf) strongSelf = weakSelf;
        value = 13;  // 延长了局部变量的生命周期
        return num * 10 + 13;
    };
    NSLog(@"%d", myBlock(5));
    return myBlock;
}

@end
