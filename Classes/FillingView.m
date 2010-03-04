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


- (void)drawRect:(CGRect)rect {
    // Drawing code
    [[UIColor blueColor] setFill];
    UIRectFill(rect);
}


- (void)dealloc {
    [super dealloc];
}


@end
