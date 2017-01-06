//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//


#import "NSNumber+SmalltalkCollections.h"

@implementation NSNumber (Collections)

-(void)timesRepeat:(ElementDefault)block
{
    NSInteger i = self.integerValue;
    if(i < 0)
    {
        [NSException raise:@"Receiver must be positive"
                    format:@"Behavior of %@ timesRepeat: is undefined",self];
    }
    while(i-- > 0)
    {
        block();
    }
}

-(void)to:(NSInteger)stop do:(ElementIterator)block
{
    NSInteger step = 1;
    if(self.integerValue > stop) { step = -1; }
        
    [self to:stop by:step do:block];
}

-(void)to:(NSInteger)stop by:(NSInteger)step do:(ElementIterator)block
{
    NSInteger start = self.integerValue;
    
    if((start < stop && step <= 0)||(start > stop && step >= 0))
    {
        [NSException raise: @"Infinite loop detected"
                    format:@"Loop from %ld to %ld by %ld will not terminate",(long)start,(long)stop,(long)step];
    }
    
    for (NSInteger i = self.integerValue;
         (start <= stop && step > 0) || (start >= stop && step < 0);
         i += step)
    {
        block(i);
    }
}


@end
