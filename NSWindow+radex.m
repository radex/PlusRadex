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

#import "NSWindow+radex.h"

@implementation NSWindow (radex)

/*
 shorthands to accessing window's frame members
 */

@dynamic x, y, w, h, size, origin;

- (CGFloat)x { return self.frame.origin.x; }
- (CGFloat)y { return self.frame.origin.y; }
- (CGFloat)w { return self.frame.size.width; }
- (CGFloat)h { return self.frame.size.height; }
- (NSSize)size { return self.frame.size; }
- (NSPoint)origin { return self.frame.origin; }

// debugging

- (void)logFrame:(NSString *)note
{
    RPLogRect(note, self.frame);
}

@end
