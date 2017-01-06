/*
 * Copyright (C) 2011-2013 Michael Dippery <michael@monkey-robot.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

#import "NSDictionary+Collections.h"

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
