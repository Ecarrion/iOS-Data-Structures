//
//  NSMutableArray+Algorithm.h
//  Data Structures
//
//  Created by Ernesto Carrión on 11/1/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^permutCompare)(id obj1, id obj2);

@interface NSMutableArray (Algorithm)

-(BOOL)nextPermutationOnCompare:(permutCompare)compareBlock;
-(void)reverse;
-(void)reverseFromIndex:(NSInteger)start toIndex:(NSInteger)end;

@end
