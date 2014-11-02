//
//  ECPriorityQueue.h
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef BOOL(^compareBlock)(id obj1, id obj2);

@interface ECPriorityQueue : NSObject


- (instancetype)initWithArray:(NSArray *)arrayOfOjects andCompareBlock:(compareBlock)cBlock;
- (instancetype)initWithCompareBlock:(compareBlock)cBlock;

- (BOOL)isEmpty;
- (id)top;
- (void)pop;
- (void)push:(id)anObject;



@end
