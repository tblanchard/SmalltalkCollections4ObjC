//
//  NSNumber+Collections.m
//  NumberStation
//
//  Created by Todd Blanchard on 3/21/14.
//
//

#import "NSNumber+Collections.h"

@implementation NSNumber (Collections)

-(void)timesRepeat:(ElementDefault)block
{
    NSInteger i = self.integerValue;
    if(i < 0){ [NSException raise:@"Receiver must be positive" format:@"Behavior of %@ timesRepeat: is undefined",self]; }
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
    
    if((start < stop && step <= 0)||(start > stop && step >= 0)) {
        [NSException raise: @"Infinite loop detected"
                    format:@"Loop from %d to %d by %d will not terminate",start,stop,step];
    }
    
    for (NSInteger i = self.integerValue; (start <= stop && step > 0) || (start >= stop && step < 0); i += step) {
        block(@(i));
    }
}


@end
