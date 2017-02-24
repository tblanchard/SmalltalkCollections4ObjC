//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//


#import "NSString+SmalltalkCollections.h"

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
