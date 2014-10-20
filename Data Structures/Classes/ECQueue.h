//
//  ECQueue.h
//  Data Structures
//
//  Created by Ernesto Carrión on 10/19/14.
//  Copyright (c) 2014 Salarion. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ECQueue : NSObject


-(id)top;
-(void)pop;
-(BOOL)empty;
-(void)push:(id)object;

@end
