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

- (instancetype)do:(ElementMutator)block
{
    [[self allObjects] do:block];
    return self;
}

- (instancetype)collect:(ElementTransformer)block
{
    return [[self class] setWithArray:[[self allObjects]collect:block]];
}

- (id)inject:(id)initial into:(ElementInjector)block
{
    return [[self allObjects]inject:initial into:block];
}

- (instancetype)reject:(ElementFilter)block
{
    return [[self class] setWithArray:[[self allObjects]reject:block]];
}

- (instancetype)select:(ElementFilter)block
{
    return [[self class] setWithArray:[[self allObjects]select:block]];
}

- (instancetype) copyWithout:(id)object
{
    return [[self class] setWithArray: [[self allObjects]copyWithout:object]];
}

- (instancetype) copyWith:(id)object
{
    return [[self class] setWithArray: [[self allObjects]copyWith:object]];
}


@end
