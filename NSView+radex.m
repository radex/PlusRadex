// 
// Copyright (c) 2010-2012 Radosław Pietruszewski, http://radexp.pl
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

@implementation NSView (radex)

- (int) x
{
    return self.frame.origin.x;
}

- (int) y
{
    return self.frame.origin.y;
}

- (int) w
{
    return self.frame.size.width;
}

- (int) h
{
    return self.frame.size.height;
}

- (void) setX:(int)newX
{
    self.frame = NSMakeRect(newX, self.frame.origin.y, self.frame.size.width, self.frame.size.height);
}

- (void) setY:(int)newY
{
    self.frame = NSMakeRect(self.frame.origin.x, newY, self.frame.size.width, self.frame.size.height);
}

- (void) setW:(int)newW
{
    self.frame = NSMakeRect(self.frame.origin.x, self.frame.origin.y, newW, self.frame.size.height);
}

- (void) setH:(int)newH
{
    self.frame = NSMakeRect(self.frame.origin.x, self.frame.origin.y, self.frame.size.width, newH);
}

- (void)logFrame
{
    NSLog(@"(%d, %d) %d x %d", self.x, self.y, self.w, self.h);
}

- (void)logBounds
{
    NSSize size = self.bounds.size;
    NSPoint origin = self.bounds.origin;
    
    NSLog(@"(%f, %f) %f x %f", origin.x, origin.y, size.width, size.height);
}

@end
