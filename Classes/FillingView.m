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

- (CGPathRef)pathInRect:(CGRect)rect {
    CGMutablePathRef path = CGPathCreateMutable();
    CGFloat radius = CGRectGetHeight(rect) / 2.0f;
    CGPathMoveToPoint(path, NULL, CGRectGetMinX(rect), CGRectGetMinY(rect));
    CGPathAddLineToPoint(path, NULL, CGRectGetMaxX(rect) - radius, CGRectGetMinY(rect));
    CGPathAddArc(path, NULL, 
                 CGRectGetMaxX(rect) - radius, 
                 CGRectGetMinY(rect) + radius,
                 radius,
                 -M_PI / 2.0f, 
                 M_PI / 2.0f, 
                 NO);
    CGPathAddLineToPoint(path, NULL, CGRectGetMinX(rect) - radius, CGRectGetMaxY(rect));
    CGPathCloseSubpath(path);
    CGPathRef imutablePath = CGPathCreateCopy(path);
    CGPathRelease(path);
    return imutablePath;
}


- (void)drawRect:(CGRect)rect {
    // Drawing code
    //    CGMutablePathRef path = CGPathCreateMutable();
    //    CGPathMoveToPoint(path, NULL, 10.0f, 10.0f);
    //    CGPathAddLineToPoint(path, NULL, 100.0f, 10.0f);
    //    CGPathAddLineToPoint(path, NULL, 100.0f, 100.0f);
    //    CGPathAddLineToPoint(path, NULL, 10.0f, 100.0f);
    //    CGPathCloseSubpath(path);
    //    CGContextRef ctx = UIGraphicsGetCurrentContext();
    //    CGContextSetFillColorWithColor(ctx, [UIColor blueColor].CGColor);
    //    CGContextAddPath(ctx, path);
    //    CGContextFillPath(ctx);
    
    CGSize size = self.bounds.size;
    CGFloat width1 = size.width * 0.75f;
    CGFloat width2 = size.width * 0.35f;
    CGFloat width3 = size.width * 0.55f;
    
    CGFloat height = size.height * 0.2f;
    
    CGRect one = CGRectMake(0.0f, (height + 5.0f), width1, height - 10.0f);
    CGRect oneText = CGRectMake(10.0f, height + 25.0f, width1, height - 30.0f);
    
    CGRect two = CGRectMake(0.0f, 2.0f * (height + 5.0f), width2, height - 10.0f);
    CGRect twoText = CGRectMake(10.0f, 2.0f * height + 25.0f, width2, height - 30.0f);
    
    CGRect three = CGRectMake(0.0f, 3.0f * (height + 5.0f), width3, height - 10.0f);
    CGRect threeText = CGRectMake(10.0f, 3.0f * height + 35.0f, width3, height - 30.0f);
    
    CGContextRef ctx = UIGraphicsGetCurrentContext();
    
    [[UIColor blueColor] setFill];
    CGPathRef pathOne = [self pathInRect:one];
    CGContextAddPath(ctx, pathOne);
    CGPathRelease(pathOne);
    CGContextFillPath(ctx);
    [[UIColor blackColor] setFill];
    [@"One" drawInRect:oneText withFont:[UIFont systemFontOfSize:34]];
    
    [[UIColor redColor] setFill];
    CGPathRef pathTwo = [self pathInRect:two];
    CGContextAddPath(ctx, pathTwo);
    CGPathRelease(pathTwo);
    CGContextFillPath(ctx);
    [[UIColor blackColor] setFill];
    [@"Two" drawInRect:twoText withFont:[UIFont systemFontOfSize:34]];
    
    [[UIColor yellowColor] setFill];
    CGPathRef pathThree = [self pathInRect:three];
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
