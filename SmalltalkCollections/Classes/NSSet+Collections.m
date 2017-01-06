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

#import "NSSet+Collections.h"
#import "NSArray+Collections.h"

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
