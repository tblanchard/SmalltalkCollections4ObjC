//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//

#import "NSSet+SmalltalkCollections.h"
#import "NSArray+SmalltalkCollections.h"

@implementation NSSet (SmalltalkCollections)

- (NSSet *)do:(ElementMutator)block
{
    [[self allObjects] do:block];
    return self;
}

- (NSSet *)collect:(ElementTransformer)block
{
    return [[self class] setWithArray:[[self allObjects]collect:block]];
}

- (id)inject:(id)initial into:(ElementInjector)block
{
    return [[self allObjects]inject:initial into:block];
}

- (NSSet *)reject:(ElementFilter)block
{
    return [[self class] setWithArray:[[self allObjects]reject:block]];
}

- (NSSet *)select:(ElementFilter)block
{
    return [[self class] setWithArray:[[self allObjects]select:block]];
}

@end
