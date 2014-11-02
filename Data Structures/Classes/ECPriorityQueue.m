//
//  ECPriorityQueue.m
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import "ECPriorityQueue.h"

@implementation ECPriorityQueue {
    
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

-(void)pop {
    
    //Exchange the top object and the last and then remove the new last object
    [heap exchangeObjectAtIndex:0 withObjectAtIndex:heap.count-1];
    [heap removeLastObject];
    
    //Percolate Down: exchange the top object with the smaller/bigger of it's children
    //                until both childer are smaller/bigger than him
    
    __block NSInteger nodeIndex;
    __block NSInteger childIndex;
    
    __block id node;
    __block id childNode;
    __block id leftChildren;
    __block id rightChildren;
    
    void (^recalculateValues)(NSInteger index) = ^(NSInteger index) {
        
        nodeIndex = index;
        node = [self nodeAtIndex:nodeIndex];
        leftChildren = [self leftChildOfNodeAtIndex:nodeIndex];
        rightChildren = [self rightChildOfNodeAtIndex:nodeIndex];
        
        if (!rightChildren && !leftChildren) {
            childNode = nil;
            return;
        }
        
        if (!rightChildren && leftChildren) {
            childNode = leftChildren;
            childIndex = [self leftChildIndexForIndex:nodeIndex];
        }
        
#warning use compare block of function
        else if ([leftChildren intValue] < [rightChildren intValue]) {
            
            childNode = leftChildren;
            childIndex = [self leftChildIndexForIndex:nodeIndex];
            
        } else {
            
            childNode = rightChildren;
            childIndex = [self rightChildIndexForIndex:nodeIndex];
        }
    };
    
    recalculateValues(0);
    
#warning use compare block of function
    while (childNode && [node intValue] > [childNode intValue]) {
        
        [heap exchangeObjectAtIndex:nodeIndex withObjectAtIndex:childIndex];
        recalculateValues(childIndex);
    }
}

-(BOOL)isEmpty {
    
    return heap.count == 0;
}

-(void)heapifyArray:(NSArray *)array {
 
    for (id obj in array) {
        [self addObject:obj];
    }
}

/*
 * - Insert the object at the end of the heap
 * - Exhange the object's Node it's parent intil it's parent is smaller/bigger that him
 */
-(void)addObject:(id)anObject {
    
    __block NSInteger currentPos;
    __block NSInteger parentIndex;
    __block id parentNode;
    
    void (^recalculateValues)(NSInteger cp) = ^(NSInteger cp) {
        currentPos = cp;
        parentIndex = [self parentIndexForIndex:currentPos];
        parentNode = [self nodeAtIndex:parentIndex];
    };
    
    [heap addObject:anObject];
    recalculateValues(heap.count - 1);
    
#warning ask for a compare block or function
    //Percolate up
    while ([anObject intValue] < [parentNode intValue]) {
        
        [heap exchangeObjectAtIndex:currentPos withObjectAtIndex:parentIndex];
        recalculateValues(parentIndex);
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
