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

#import <Cocoa/Cocoa.h>

@interface NSBezierPath (radex)

+ (NSBezierPath*) rect:(NSRect)frame inset:(float)inset radius:(float)radius;
+ (NSBezierPath*) setRect:(NSRect)frame inset:(float)inset radius:(float)radius;

#pragma mark -
#pragma mark Constructing paths

/*
 Equivalents of:
 [path moveToPoint:NSMakePoint(x,y)];
 [path relativeMoveToPoint:NSMakePoint(x,y)];
 [path lineToPoint:NSMakePoint(x,y)];
 [path relativeLineToPoint:NSMakePoint(x,y)];
 */

- (void) setX:(CGFloat)x Y:(CGFloat)y;      // moves current point to (x,y)

- (void) mx:(CGFloat)x y:(CGFloat)y;        // moves current point by (x,y), relatively to the current point
- (void) mx:(CGFloat)x;                     // moves current point by (x,0), relatively to the current point
- (void) my:(CGFloat)y;                     // moves current point by (0,y), relatively to the current point

- (void) lineToX:(CGFloat)x Y:(CGFloat)y;   // draws line from current point to (x,y)

- (void) lx:(CGFloat)x y:(CGFloat)y;        // draws line to the point (x,y) relative to the current point
- (void) lx:(CGFloat)x;                     // draws line to the point (x,0) relative to the current point
- (void) ly:(CGFloat)y;                     // draws line to the point (0,y) relative to the current point

/*
 Draws a rounded corner (as specified in argument) with `radius` radius
 
 Note that it only works if you do drawing in counterclockwise manner
 */

typedef enum
{
    BottomLeft,
    BottomRight,
    TopRight,
    TopLeft
} RPCorner;

- (void) corner:(RPCorner)corner radius:(CGFloat)radius;

@end
