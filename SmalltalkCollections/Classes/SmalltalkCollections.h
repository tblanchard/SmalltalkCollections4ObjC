//
//  SmalltalkCollections.h
//  Pods
//
//  Created by Todd Blanchard on 12/18/16.
//
//  Based in part on a library by Michael Dippery <michael@monkey-robot.com>
//
//

// Common Block Typedefs
typedef BOOL    (^ElementFilter)(id); // select:, detect:, reject:
typedef void    (^ElementMutator)(id); // do:
typedef id      (^ElementTransformer)(id); // collect:

typedef BOOL    (^CharacterFilter)(unichar); // NSString select: detect: reject:
typedef void    (^CharacterMutator)(unichar); // NSString do:
typedef unichar (^CharacterTransformer)(unichar); // collect:

typedef id   (^IndexedTransformer)(id,NSInteger);
typedef void (^IndexedMutator)(id,NSInteger);
typedef void (^PairedMutator)(NSString*,id);
typedef BOOL (^PairedFilter)(NSString*,id);
typedef id (^ElementDefault)(void);
typedef id (^ElementInjector)(id, id);

typedef void (^StringMutator)(NSString *);

typedef void(^ElementIterator)(NSInteger);
typedef id(^ElementIndexedMutator)(NSInteger);

#import "NSArray+SmalltalkCollections.h"
#import "NSDictionary+SmalltalkCollections.h"
#import "NSNumber+SmalltalkCollections.h"
#import "NSSet+SmalltalkCollections.h"

