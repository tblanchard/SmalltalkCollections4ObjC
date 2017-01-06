//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//


#import "NSDictionary+SmalltalkCollections.h"

@implementation NSDictionary (SmalltalkCollections)

- (instancetype)keysAndValuesDo:(PairedMutator)block
{
    if([self respondsToSelector:@selector(enumerateKeysAndObjectsUsingBlock:)])
    {
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            block(key,obj);
        }];
    }
    else
    {
        for (NSString* key in self) {
            block(key,[self objectForKey:key]);
        }
    }
    return self;
}

- (instancetype)do:(ElementMutator)block
{
    if([self respondsToSelector:@selector(enumerateKeysAndObjectsUsingBlock:)])
    {
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            block(obj);
        }];
    }
    else
    {
        for (NSString* key in self) {
            block([self objectForKey:key]);
        }
    }
    return self;
}

- (instancetype)keysDo:(ElementMutator)block
{
    if([self respondsToSelector:@selector(enumerateKeysAndObjectsUsingBlock:)])
    {
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            block(key);
        }];
    }
    else
    {
        for (NSString* key in self) {
            block([self objectForKey:key]);
        }
    }
    return self;
}

- (instancetype)valuesDo:(ElementMutator)block
{
    return [self do:block];
}

- (instancetype)collect:(ElementTransformer)block
{
    NSMutableDictionary* mutable = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    if([self respondsToSelector:@selector(enumerateKeysAndObjectsUsingBlock:)])
    {
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            [mutable setObject:block(obj) forKey:key];
        }];
    }
    else
    {
        for (NSString* key in self) {
            [mutable setObject: block([self objectForKey:key]) forKey:key];
        }
    }
    return [self class] == [mutable class] ? mutable : [[self class]dictionaryWithDictionary:mutable];
}

- (id)inject:(id)initial into:(ElementInjector)block
{
    for(id item in self)
    {
        initial = block(initial,[self at: item]);
    }
    return initial;
}

- (instancetype)reject:(ElementFilter)block
{
    return [self select:^BOOL(id obj) {
        return !block(obj);
    }];
}

- (instancetype)select:(ElementFilter)block
{
    NSMutableDictionary* mutable = [NSMutableDictionary dictionaryWithCapacity:self.count];
    
    if([self respondsToSelector:@selector(enumerateKeysAndObjectsUsingBlock:)])
    {
        [self enumerateKeysAndObjectsUsingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
            if(block(obj)) [mutable setObject:obj forKey:key];
        }];
    }
    else
    {
        for (NSString* key in self) {
            id obj = [self objectForKey:key];
            if(block(obj)) [mutable setObject:obj forKey:key];
        }
    }
    return [self class] == [mutable class] ? mutable : [[self class]dictionaryWithDictionary:mutable];
    
}

-(id)at:(id)key
{
    return [self objectForKey:key];
}

-(id)at:(id)key ifAbsent:(ElementDefault)block
{
    id obj = [self objectForKey:key];
    return obj ? obj : block();
}

@end

@implementation NSMutableDictionary (SmalltalkCollections)

-(void)at:(id)key put:(id)object
{
    [self setObject:object forKeyedSubscript:key];
}

@end
