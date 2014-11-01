//
//  ECBinaryHeap.h
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECBinaryHeap : NSObject


- (instancetype)initWithArray:(NSArray *)arrayOfOjects;
- (void)addObject:(id)anObject;
- (id)top;
- (BOOL)isEmpty;

- (void)traverseStartingAt:(NSInteger)index;

@end
