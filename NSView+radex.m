// 
// Copyright (c) 2010-2013 Radosław Pietruszewski, http://radexp.pl
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

#import "NSview+radex.h"

void RPLogRect(NSString *note, NSRect rect)
{
    NSLog(@"%@: (%f,%f) %f⨉%f", note, rect.origin.x, rect.origin.y, rect.size.width, rect.size.height);
}

@implementation NSView (radex)

/*
 shorthands to operations on view's frame struct members
 */

@dynamic x, y, w, h, size, origin;

- (CGFloat)x { return self.frame.origin.x; }
- (CGFloat)y { return self.frame.origin.y; }
- (CGFloat)w { return self.frame.size.width; }
- (CGFloat)h { return self.frame.size.height; }
- (NSSize)size { return self.frame.size; }
- (NSPoint)origin { return self.frame.origin; }

- (void)setX:(CGFloat)x
{
    NSRect frame = self.frame;
    frame.origin.x = x;
    self.frame = frame;
}

- (void)setY:(CGFloat)y
{
    NSRect frame = self.frame;
    frame.origin.y = y;
    self.frame = frame;
}

- (void)setW:(CGFloat)w
{
    NSRect frame = self.frame;
    frame.size.width = w;
    self.frame = frame;
}

- (void)setH:(CGFloat)h
{
    NSRect frame = self.frame;
    frame.size.height = h;
    self.frame = frame;
}

- (void)setSize:(NSSize)size
{
    NSRect frame = self.frame;
    frame.size = size;
    self.frame = frame;
}

- (void)setOrigin:(NSPoint)origin
{
    NSRect frame = self.frame;
    frame.origin = origin;
    self.frame = frame;
}

// debugging

- (void)logFrame:(NSString *)note
{
    RPLogRect(note, self.frame);
}

@end
