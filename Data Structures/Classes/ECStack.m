//
//  ECStack.m
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import "ECStack.h"

@implementation ECStack {
    
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
    
    return [array lastObject];
}

-(void)pop {
    
    if ([array lastObject]) {
        [array removeLastObject];
    }
}

-(BOOL)empty {
    
    return [array firstObject] == nil;
}

-(void)push:(id)object {
    
    [array addObject:object];
}

@end
