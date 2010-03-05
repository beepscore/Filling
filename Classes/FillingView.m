//
//  FillingView.m
//  Filling
//
//  Created by Steve Baker on 3/3/10.
//  Copyright 2010 Beepscore LLC. All rights reserved.
//

#import "FillingView.h"


@implementation FillingView


- (id)initWithFrame:(CGRect)frame {
    if (self = [super initWithFrame:frame]) {
        // Initialization code
    }
    return self;
}


// refactor / rename pathInRect to newPathInRect to eliminate Clang warning by following naming convention
// Ref http://moodle.extn.washington.edu/mod/forum/discuss.php?d=4779
// http://stackoverflow.com/questions/1779966/how-do-i-release-this-cgpath-when-i-need-to-return-it
- (CGPathRef)newPathInRect:(CGRect)rect {
    CGMutablePathRef path = CGPathCreateMutable();

    // radius of rounded end is half bar height
    CGFloat radius = CGRectGetHeight(rect) / 2.0f;
    // top left corner
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    // top right corner
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect) - radius, CGRectGetMinY(rect));
    // semicircle
    CGPathAddArc(path, NULL, 
                 CGRectGetMaxX(rect) - radius, 
                 CGRectGetMinY(rect) + radius,
                 radius,
                 -M_PI / 2.0f, 
                 M_PI / 2.0f, 
                 NO);
    // bottom left corner
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect) - radius, CGRectGetMaxY(rect));
    CGPathCloseSubpath(path);
    CGPathRef imutablePath = CGPathCreateCopy(path);
    CGPathRelease(path);
    return imutablePath;
}

- (void)drawSquare {
    // create and build the path
    CGMutablePathRef path = CGPathCreateMutable();
    CGPathMoveToPoint(path, NULL, 10.0f, 10.0f);
    CGPathAddLineToPoint(path, NULL, 100.0f, 10.0f);
    CGPathAddLineToPoint(path, NULL, 100.0f, 100.0f);
    CGPathAddLineToPoint(path, NULL, 10.0f, 100.0f);
    CGPathCloseSubpath(path);
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    // configure the fill parameters and fill the path
    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    CGContextAddPath(ctx, path);
    CGContextFillPath(ctx);

    // configure the stroke parameters and stroke the path
    CGContextSetStrokeColorWithColor(ctx, [UIColor yellowColor].CGColor);
    CGContextSetLineWidth(ctx, 10.0f);
    CGContextAddPath(ctx, path);
    CGContextStrokePath(ctx);    
    
    CGPathRelease(path);
}


- (void)drawRect:(CGRect)rect {
    // Drawing code

    [self drawSquare];
    
    CGSize size = self.bounds.size;
    
    // bar one width is 0.75 * view width
    CGFloat width1 = size.width * 0.75f;
    CGFloat width2 = size.width * 0.35f;
    CGFloat width3 = size.width * 0.55f;
    
    // bar height is 0.2 * view height    
    CGFloat height = size.height * 0.2f;
    
    CGFloat yOffset = 40.0f;
    
    //           CGRectMake(x, y, width, height)
    CGRect one = CGRectMake(0.0f, (height + 5.0f) + yOffset, width1, height - 10.0f);
    CGRect oneText = CGRectMake(10.0f, height + 25.0f + yOffset, width1, height - 30.0f);
    
    CGRect two = CGRectMake(0.0f, 2.0f * (height + 5.0f) + yOffset, width2, height - 10.0f);
    CGRect twoText = CGRectMake(10.0f, (2.0f * height) + 30.0f + yOffset, width2, height - 30.0f);
    
    CGRect three = CGRectMake(0.0f, 3.0f * (height + 5.0f) + yOffset, width3, height - 10.0f);
    CGRect threeText = CGRectMake(10.0f, (3.0f * height) + 35.0f + yOffset, width3, height - 30.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor blueColor] setFill];
    CGPathRef pathOne = [self newPathInRect:one];
    CGContextAddPath(ctx, pathOne);
    CGPathRelease(pathOne);
    CGContextFillPath(ctx);
    [[UIColor blackColor] setFill];
    [@"One" drawInRect:oneText withFont:[UIFont systemFontOfSize:34]];
    
    [[UIColor redColor] setFill];
    CGPathRef pathTwo = [self newPathInRect:two];
    CGContextAddPath(ctx, pathTwo);
    CGPathRelease(pathTwo);
    CGContextFillPath(ctx);
    [[UIColor blackColor] setFill];
    [@"Two" drawInRect:twoText withFont:[UIFont systemFontOfSize:34]];
    
    [[UIColor yellowColor] setFill];
    CGPathRef pathThree = [self newPathInRect:three];
    CGContextAddPath(ctx, pathThree);
    CGPathRelease(pathThree);
    CGContextFillPath(ctx);
    [[UIColor blackColor] setFill];
    [@"Three" drawInRect:threeText withFont:[UIFont systemFontOfSize:34]];
}


- (void)dealloc {
    [super dealloc];
}

@end
