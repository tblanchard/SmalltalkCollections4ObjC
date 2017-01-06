//
//  NSNumber+SmalltalkCollections.h
//
//  Created by Todd Blanchard on 3/21/14.
//
//

#import <Foundation/Foundation.h>
#import "SmalltalkCollections.h"

@interface NSNumber (Collections)

-(void)timesRepeat:(ElementDefault)block;
-(void)to:(NSInteger)stop do:(ElementIterator)block;
-(void)to:(NSInteger)stop by:(NSInteger)step do:(ElementIterator)block;

@end
