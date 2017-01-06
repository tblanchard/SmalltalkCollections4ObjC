//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//


#import "NSArray+SmalltalkCollections.h"
#import "NSNumber+SmalltalkCollections.h"


@implementation NSArray (SmalltalkCollections)

-(instancetype)doWithIndex:(IndexedMutator)block;
{
    if ([self respondsToSelector:@selector(enumerateObjectsUsingBlock:)]) {
        [self enumerateObjectsUsingBlock:^ (id obj, NSUInteger idx, BOOL *stop) { block(obj,idx); }];
    }
    else
    {
        [@(0) to: (self.count-1) do:^(NSInteger idx) {
            block(self[idx],idx);
        }];
    }
    return self;
}

-(instancetype)do:(ElementMutator)block
{
    [self doWithIndex:^(id object, NSInteger idx) {
        block(object);
    }];
    return self;
}

- (instancetype)collectWithIndex:(IndexedTransformer)block
{
    NSMutableArray* a = [NSMutableArray arrayWithCapacity: self.count];
    if ([self respondsToSelector:@selector(enumerateObjectsUsingBlock:)]) {
        [self enumerateObjectsUsingBlock:^ (id obj, NSUInteger idx, BOOL *stop) { [a addObject:block(obj,idx)]; }];
    }
    else
    {
         [@(0) to: (self.count-1) do:^(NSInteger idx) {
            [a addObject:block(self[idx],idx)];
        }];
    }
    return [a class] == [self class] ? a : [[self class]arrayWithArray:a];
}


- (instancetype)collect:(ElementTransformer)block
{
    return [self collectWithIndex:^id(id object, NSInteger idx) {
        return block(object);
    }];
}

- (instancetype)select:(ElementFilter)block
{
    NSMutableArray* a = [NSMutableArray arrayWithCapacity: self.count];
    if ([self respondsToSelector:@selector(enumerateObjectsUsingBlock:)]) {
        [self enumerateObjectsUsingBlock:^ (id obj, NSUInteger idx, BOOL *stop) { if(block(obj)) { [a addObject:obj]; }}];
    }
    else
    {
        [@(0) to: (self.count-1) do:^(NSInteger idx) {
            id obj = self[idx];
            if(block(obj)) { [a addObject:obj]; }
        }];
    }
    return [a class] == [self class] ? a : [[self class]arrayWithArray:a];
}

- (instancetype)reject:(ElementFilter)block
{
    NSMutableArray* a = [NSMutableArray arrayWithCapacity: self.count];
    if ([self respondsToSelector:@selector(enumerateObjectsUsingBlock:)]) {
        [self enumerateObjectsUsingBlock:^ (id obj, NSUInteger idx, BOOL *stop) { if(!block(obj)) { [a addObject:obj]; }}];
    }
    else
    {
        [@(0) to: (self.count-1) do:^(NSInteger idx) {
            id obj = self[idx];
            if(!block(obj)) { [a addObject:obj]; }
        }];
    }
    return [a class] == [self class] ? a : [[self class]arrayWithArray:a];
}

- (id)detect:(ElementFilter)block ifNone:(ElementDefault)none
{
    __block id detected = nil;
    if ([self respondsToSelector:@selector(enumerateObjectsUsingBlock:)]) {
        [self enumerateObjectsUsingBlock:^ (id obj, NSUInteger idx, BOOL *stop) {
            if(block(obj)) { *stop = YES; detected = obj; }
        }];
    }
    else
    {
        for(int idx = 0; idx < [self count] && !detected; ++idx) {
            id obj = self[idx];
            if(block(obj)) { detected = obj; }
        }
    }
    return detected ? detected : none();
}

- (id)detect:(ElementFilter)block
{
    return [self detect: block ifNone:^id{
        return nil;
    }];
}

- (id)inject:(id)initial into:(ElementInjector)block
{
    for(id item in self)
    {
        initial = block(initial,item);
    }
    return initial;
}

-(NSArray*)copyWith:(id)object
{
    return [self arrayByAddingObjectsFromArray:object];
}

-(NSArray*)copyWithout:(id)object
{
    NSMutableArray* copy = [self mutableCopy];
    [copy removeObject:object];
    if([copy class] != [self class])
    {
        return [[self class]arrayWithArray:copy];
    }
    return copy;
}

-(id)at:(NSUInteger)idx
{
    return [self objectAtIndex: idx];
}

-(id)at:(NSUInteger)idx ifAbsent:(ElementDefault)block
{
    if(idx < [self count])
    {
        return [self objectAtIndex: idx];
    }
    return block();
}


@end

@implementation NSMutableArray (SmalltalkCollections)

-(void)at:(NSUInteger)idx put:(id)object
{
    [self setObject: object atIndexedSubscript:idx];
}

@end

