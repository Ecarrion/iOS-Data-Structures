//
//  main.m
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ECQueue.h"
#import "ECStack.h"
#import "ECBinaryHeap.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        ECBinaryHeap * bh = [[ECBinaryHeap alloc] initWithArray:@[@(3), @(7), @(8), @(4), @(2), @(46), @(7), @(5), @(1), @(2), @(4)]];
        NSLog(@"%@", [bh top]);
        
    }
    return 0;
}
