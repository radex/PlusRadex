//
// Copyright (c) 2012 Radosław Pietruszewski, http://radexp.pl
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

#import "NSBezierPath+radex.h"

@implementation NSBezierPath (radex)

+ (NSBezierPath *)rect:(NSRect)frame inset:(float)inset radius:(float)radius
{
    return [NSBezierPath bezierPathWithRoundedRect:NSInsetRect(frame, inset, inset) xRadius:radius yRadius:radius];
}

+ (NSBezierPath *)setRect:(NSRect)frame inset:(float)inset radius:(float)radius
{
    NSBezierPath *path = [self rect:frame inset:inset radius:radius];
    [path setClip];
    return path;
}

#pragma mark -
#pragma mark Constructing paths

- (void) setX:(CGFloat)x Y:(CGFloat)y
{
    [self moveToPoint:NSMakePoint(x, y)];
}

- (void) mx:(CGFloat)x y:(CGFloat)y
{
    [self relativeMoveToPoint:NSMakePoint(x, y)];
}

- (void) mx:(CGFloat)x
{
    [self relativeMoveToPoint:NSMakePoint(x, 0)];
}

- (void) my:(CGFloat)y
{
    [self relativeMoveToPoint:NSMakePoint(0, y)];
}

- (void) lineToX:(CGFloat)x Y:(CGFloat)y
{
    [self lineToPoint:NSMakePoint(x, y)];
}

- (void) lx:(CGFloat)x y:(CGFloat)y
{
    [self relativeLineToPoint:NSMakePoint(x, y)];
}

- (void) lx:(CGFloat)x
{
    [self relativeLineToPoint:NSMakePoint(x, 0)];
}

- (void) ly:(CGFloat)y
{
    [self relativeLineToPoint:NSMakePoint(0, y)];
}

/*
 rounded corners
 */

- (void) corner:(RPCorner)corner radius:(CGFloat)r
{
    NSPoint middle,end;
    middle = end = [self currentPoint];
    
    switch(corner)
    {
        case BottomLeft:
            middle.y -= r;
            end.y -= r;
            end.x += r;
            break;
        case BottomRight:
            middle.x += r;
            end.x += r;
            end.y += r;
            break;
        case TopRight:
            middle.y += r;
            end.y += r;
            end.x -= r;
            break;
        case TopLeft:
            middle.x -= r;
            end.x -= r;
            end.y -= r;
            break;
    }
    
    [self appendBezierPathWithArcFromPoint:middle toPoint:end radius:r];
}

@end
