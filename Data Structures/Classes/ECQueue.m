//
//  ECQueue.m
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import "ECQueue.h"

@implementation ECQueue {
    
    NSMutableArray * array;
}

- (instancetype)init {
    
    self = [super init];
    if (self) {
        
        array = [NSMutableArray array];
        
    }
    return self;
}

-(id)top {
    
    return [array firstObject];
}

-(void)pop {
    
    if ([array firstObject]) {
        [array removeObjectAtIndex:0];
    }
}

-(BOOL)empty {
    
    return [array firstObject] == nil;
}

-(void)push:(id)object {
    
    [array addObject:object];
}

@end
