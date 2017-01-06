/*
 * Copyright (C) 2012-2013 Michael Dippery <michael@monkey-robot.com>
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

#import "NSString+Collections.h"

@implementation NSString (SmalltalkCollections)

-(NSString*)collect:(CharacterTransformer)block
{
    NSMutableString* s = [self mutableCopy];
    for (int i = 0; i < [self length]; i++) {
        unichar c = block([s characterAtIndex:i]);
        NSString* sub = [NSString stringWithCharacters:&c length:1];
        [s replaceCharactersInRange:NSMakeRange(i, 1) withString:sub];
    }
    return [NSString stringWithString:s];
}

-(NSString*)select:(CharacterFilter)block
{
    NSMutableString* s = [NSMutableString stringWithCapacity:[self length]];
    for (int i = 0; i < [self length]; i++)
    {
        unichar c = [self characterAtIndex:i];
        if(block(c))
        {
            NSString* sub = [NSString stringWithCharacters:&c length:1];
            [s appendString:sub];
        }
    }
    return [NSString stringWithString:s];
}

-(NSString*)reject:(CharacterFilter)block
{
    NSMutableString* s = [NSMutableString stringWithCapacity:[self length]];
    for (int i = 0; i < [self length]; i++)
    {
        unichar c = [self characterAtIndex:i];
        if(!block(c))
        {
            NSString* sub = [NSString stringWithCharacters:&c length:1];
            [s appendString:sub];
        }
    }
    return [NSString stringWithString:s];
}

-(NSString*)detect:(CharacterFilter)block
{
    for (int i = 0; i < [self length]; i++)
    {
        unichar c = [self characterAtIndex:i];
        if(block(c))
        {
            NSString* sub = [NSString stringWithCharacters:&c length:1];
            return sub;
        }
    }
    return @"";
}

-(void)do:(CharacterMutator)block
{
    for (int i = 0; i < [self length]; i++)
    {
        unichar c = [self characterAtIndex:i];
        block(c);
    }
}

-(void)linesDo:(StringMutator)block
{
    NSString* normalized = [self stringByReplacingOccurrencesOfString:@"\r\n" withString:@"\n"];
    normalized = [normalized stringByReplacingOccurrencesOfString:@"\r" withString:@"\n"];
    NSArray* lines = [normalized componentsSeparatedByString:@"\n"];
    for (NSString* s in lines) {
        block(s);
    }
}

@end
