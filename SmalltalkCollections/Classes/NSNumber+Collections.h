//
//  NSNumber+Collections.h
//  NumberStation
//
//  Created by Todd Blanchard on 3/21/14.
//
//

#import <Foundation/Foundation.h>
#import "Collections.h"

@interface NSNumber (Collections)

-(void)timesRepeat:(ElementDefault)block;
-(void)to:(NSInteger)stop do:(ElementIterator)block;
-(void)to:(NSInteger)stop by:(NSInteger)step do:(ElementIterator)block;

@end
