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
#import "ECPriorityQueue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        ECPriorityQueue * bh = [[ECPriorityQueue alloc] initWithArray:@[@(3), @(7), @(8), @(4), @(2), @(46), @(7), @(5), @(1), @(2), @(4)]];
        
        while (![bh isEmpty]) {
            NSLog(@"%@", [bh top]);
            [bh pop];
        }
        
    }
    return 0;
}
