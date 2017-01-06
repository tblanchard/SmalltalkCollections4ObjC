//
//  Collections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//


#import <Foundation/Foundation.h>
#import "SmalltalkCollections.h"

@interface NSDictionary (SmalltalkCollections)

- (instancetype)keysAndValuesDo:(PairedMutator)block;
- (instancetype)do:(ElementMutator)block;
- (instancetype)keysDo:(ElementMutator)block;
- (instancetype)valuesDo:(ElementMutator)block;
- (instancetype)collect:(ElementTransformer)block;
- (id)inject:(id)initial into:(ElementInjector)block;
- (instancetype)reject:(ElementFilter)block;
- (instancetype)select:(ElementFilter)block;

-(id)at:(id)key;
-(id)at:(id)key ifAbsent:(ElementDefault)block;

@end

@interface NSMutableDictionary (SmalltalkCollections)

-(void)at:(NSString*)key put:(id)object;

@end
