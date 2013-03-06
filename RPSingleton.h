//
// Copyright (c) 2013 Radosław Pietruszewski, http://radexp.pl
//
// Permission is hereby granted, free of charge, to any person obtaining
// a copy of this software and associated documentation files (the
// "Software"), to deal in the Software without restriction, including
// without limitation the rights to use, copy, modify, merge, publish,
// distribute, sublicense, and/or sell copies of the Software, and to
// permit persons to whom the Software is furnished to do so, subject to
// the following conditions:
//
// The above copyright notice and this permission notice shall be
// included in all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND,
// EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
// MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND
// NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE
// LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION
// OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION
// WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.
//

#import <Foundation/Foundation.h>

//#define RPSingletonLog1(str, ...) NSLog([@"(RPSingleton) " stringByAppendingString:str], __VA_ARGS__);
//#define RPSingletonLog2(str, ...) NSLog([@"(RPSingleton) " stringByAppendingString:str], __VA_ARGS__);
#define RPSingletonLog1(...)
#define RPSingletonLog2(...)

/*
 
 To make a global object, add <RPSingleton> protocol in class interface
 and call RPSingletonize(); in class implementation.
 
 From then on, every instance of the class will be the very same object.
 
 You can create new pointers to the global object the following ways:
 - obj = [[YourClass alloc] init];
 - obj = [YourClass new];
 - obj = YourClass.s;
 - by adding an object to a Nib file
 
 Best of all: you can have the object instances in _many_ Nib files and it will be the same object.
 You can even hook its outlets from different Nibs or have other Nib objects set up target/action pairs
 with it and it will all just work.
 
 PS. The +s method is just a convenience for +new as it's just much nicer to type in long message chains.
 
 */

@protocol RPSingleton <NSObject>

+ (instancetype) s;

@end

#define RP_Singletonize() \
\
+ (id) allocWithZone:(NSZone *)zone\
{\
    RPSingletonLog1(@"Alloc: %@", self); \
    static id globalInstance;\
    \
    if(!globalInstance)\
    {\
        RPSingletonLog2(@"Alloc once: %@", self);\
        globalInstance = [super allocWithZone:zone];\
    }\
    \
    return globalInstance;\
}\
\
+ (instancetype) s\
{\
    RPSingletonLog1(@"s: %@", self);\
    return [[self allocWithZone:nil] init];\
}

/*
 
 The problem with RPSingletonize() is that even though every instance is the same,
 each time +s/+new is called, -init is also called.
 
 To make sure the object is only initialized once, instead of definining -init,
 use RP_InitOnce macro in class implementation like so:
 
 RP_InitOnce(
 {
     // (your initialization code)
 });
 
 Note that you don't have to write `if(self = [super init])` or `return self`.
 It just works.
 
 */

#define RP_InitOnce(...) \
- (id)init\
{\
    RPSingletonLog1(@"Init: %@", self);\
    static BOOL didInit;\
    if(!didInit)\
    {\
        if(self = [super init])\
        {\
            RPSingletonLog2(@"Init once: %@", self);\
            __VA_ARGS__\
            didInit = YES;\
        }\
    }\
    \
    return self;\
}

/*
 
 Similarily to -init, the -awakeFromNib method is called every time an instance is created through a Nib file.
 
 To make sure that your global object is only sent the "awake from nib" message once,
 instead of defining -awakeFromNib, use RP_AwakeFromNibOnce macro in class implementation like so:
 
 RP_AwakeFromNibOnce(
 {
     // (your initialization code)
 });
 
 */

#define RP_AwakeFromNibOnce(...) \
- (void)awakeFromNib\
{\
    RPSingletonLog1(@"Awake: %@", self);\
    static BOOL didAwake;\
    \
    if(!didAwake)\
    {\
        RPSingletonLog2(@"Awake once: %@", self);\
        __VA_ARGS__\
        didAwake = YES;\
    }\
}


