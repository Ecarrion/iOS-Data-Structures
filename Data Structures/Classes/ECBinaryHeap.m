//
//  ECBinaryHeap.m
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import "ECBinaryHeap.h"

@implementation ECBinaryHeap {
    
    NSMutableArray * heap;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        heap = [NSMutableArray array];
    }
    
    return self;
}

- (instancetype)initWithArray:(NSArray *)arrayOfOjects {
    
    self = [self init];
    if (self) {
        
        [self heapifyArray:arrayOfOjects];
    }
    return self;
}

-(id)top {
    
    return [heap firstObject];
}

-(BOOL)isEmpty {
    
    return heap.count == 0;
}

-(void)traverseStartingAt:(NSInteger)index {
    
    if (![self nodeAtIndex:index])
        return;
    
    [self traverseStartingAt:[self leftChildIndexForIndex:index]];
    
    id node = [self nodeAtIndex:index];
    NSLog(@"%@", node);
    
    [self traverseStartingAt:[self rightChildIndexForIndex:index]];
}

-(void)heapifyArray:(NSArray *)array {
 
    for (id obj in array) {
        [self addObject:obj];
    }
}

-(void)addObject:(id)anObject {
    
    [heap addObject:anObject];
    
    NSInteger currentPos = heap.count - 1;
    NSInteger parentIndex = [self parentIndexForIndex:currentPos];
    id parentNode = [self nodeAtIndex:parentIndex];
    
    while ([anObject intValue] < [parentNode intValue]) {
        
        [heap exchangeObjectAtIndex:currentPos withObjectAtIndex:parentIndex];
        
        currentPos = parentIndex;
        parentIndex = [self parentIndexForIndex:currentPos];
        parentNode = [self nodeAtIndex:parentIndex];
    }
}

#pragma mark - Convenience

-(NSInteger)leftChildIndexForIndex:(NSInteger)index {
    
    return (2*index)+1;
}

-(NSInteger)rightChildIndexForIndex:(NSInteger)index {
    
    return (2*index)+2;
}

-(NSInteger)parentIndexForIndex:(NSInteger)index {
    
    return (index-1)/2;
}

-(id)leftChildOfNodeAtIndex:(NSInteger)index {
    
    return [self nodeAtIndex:[self leftChildIndexForIndex:index]];
}

-(id)rightChildOfNodeAtIndex:(NSInteger)index {
    
    return [self nodeAtIndex:[self rightChildIndexForIndex:index]];
}

-(id)parentOfNodeAtIndex:(NSInteger)index {
    
    return [self nodeAtIndex:[self parentIndexForIndex:index]];
}

-(id)nodeAtIndex:(NSInteger)index {
    
    if (index >= [heap count])
        return nil;
    
    return heap[index];
}

@end
