# SmalltalkCollections

[![CI Status](http://img.shields.io/travis/tblanchard/SmalltalkCollections.svg?style=flat)](https://travis-ci.org/tblanchard/SmalltalkCollections)
[![Version](https://img.shields.io/cocoapods/v/SmalltalkCollections.svg?style=flat)](http://cocoapods.org/pods/SmalltalkCollections)
[![License](https://img.shields.io/cocoapods/l/SmalltalkCollections.svg?style=flat)](http://cocoapods.org/pods/SmalltalkCollections)
[![Platform](https://img.shields.io/cocoapods/p/SmalltalkCollections.svg?style=flat)](http://cocoapods.org/pods/SmalltalkCollections)

## Example

To run the example project, clone the repo, and run `pod install` from the Example directory first.

## Requirements

## Installation

SmalltalkCollections is meant to be available through [CocoaPods](http://cocoapods.org). To install
it, simply add the following line to your Podfile:

```ruby
pod "SmalltalkCollections"
```

But I am not at all certain I have the pod manifest correct.  So downloading and just adding the files to your project might be your best bet.  Experienced pod builders that want to help - pull requests would be super welcome.

## Available Methods

```objc
@interface NSArray (SmalltalkCollections)

- (instancetype)do:(ElementMutator)block;
- (instancetype)doWithIndex:(IndexedMutator)block;
- (instancetype)collect:(ElementTransformer)block;
- (instancetype)collectWithIndex:(IndexedTransformer)block;
- (id)detect:(ElementFilter)block;
- (id)detect:(ElementFilter)block ifNone:(ElementDefault)none;
- (id)inject:(id)initial into:(ElementInjector)block;
- (instancetype)reject:(ElementFilter)block;
- (instancetype)select:(ElementFilter)block;

-(instancetype)copyWithout:(id)object;
-(instancetype)copyWith:(id)object;

-(id)at:(NSUInteger)idx;
-(id)at:(NSUInteger)idx ifAbsent:(ElementDefault)block;

@end

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

@interface NSSet (SmalltalkCollections)

- (instancetype)do:(ElementMutator)block;
- (instancetype)collect:(ElementTransformer)block;
- (id)inject:(id)initial into:(ElementInjector)block;
- (instancetype)reject:(ElementFilter)block;
- (instancetype)select:(ElementFilter)block;

-(instancetype)copyWithout:(id)object;
-(instancetype)copyWith:(id)object;

@end

@interface NSString (SmalltalkCollections)

-(NSString*)collect:(CharacterTransformer)block;
-(NSString*)select:(CharacterFilter)block;
-(NSString*)reject:(CharacterFilter)block;
-(NSString*)detect:(CharacterFilter)block;
-(void)do:(CharacterMutator)block;
-(void)linesDo:(StringMutator)block;

@end

@interface NSNumber (Collections)

-(void)timesRepeat:(ElementDefault)block;
-(void)to:(NSInteger)stop do:(ElementIterator)block;
-(void)to:(NSInteger)stop by:(NSInteger)step do:(ElementIterator)block;
-(NSArray*)to:(NSInteger)stop collect:(ElementIndexedMutator)block;
-(NSArray*)to:(NSInteger)stop by:(NSInteger)step collect:(ElementIndexedMutator)block;

@end
```
## Examples

```objc
NSArray* colors = @[@"red", @"yellow", @"blue", @"orange", @"green", @"violet"];

// iteration
[colors do:^(NSString* s) { NSLog(@"%@",s); }];
// map or mutation
[colors collect:^(NSString* s) { return [s uppercaseString]; }];
// filtering
[colors select:^(NSString* s) { return [s isEqualToString: @"orange"] || [s isEqualToString: @"red"]; }];

```

## Author

tblanchard, tblanchard@mac.com

## License

SmalltalkCollections is available under the MIT license. See the LICENSE file for more info.
