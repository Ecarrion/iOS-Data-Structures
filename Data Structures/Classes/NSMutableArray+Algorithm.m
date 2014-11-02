//
//  NSMutableArray+Algorithm.m
//  Data Structures
//
//  Created by Ernesto Carrión on 11/1/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import "NSMutableArray+Algorithm.h"

@implementation NSMutableArray (Algorithm)

-(BOOL)nextPermutationOnCompare:(permutCompare)compareBlock {
    
    NSInteger first = 0;
    NSInteger last = self.count;
    
    if (first == last)
        return NO;
    
    NSInteger i = last;
    if (first == --i)
        return NO;
    
    while (YES) {
        
        NSInteger i1, i2;
        i1 = i;
        
        if (compareBlock(self[--i], self[i1])) {
            i2 = last;
            while (!compareBlock(self[i], self[--i2]));
            [self exchangeObjectAtIndex:i withObjectAtIndex:i2];
            [self reverseFromIndex:i1 toIndex:last];
            return YES;
        }
        
        if (i == first) {
            [self reverseFromIndex:first toIndex:last];
            return NO;
        }   
    }
}

-(void)reverse {
    
    [self reverseFromIndex:0 toIndex:self.count];
}

-(void)reverseFromIndex:(NSInteger)start toIndex:(NSInteger)end {
    
    end--;
    while (start < end) {
        
        [self exchangeObjectAtIndex:start withObjectAtIndex:end];
        start++;
        end--;
    }
}

@end
