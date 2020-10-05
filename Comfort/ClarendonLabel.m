//
//  ClarendonLabel.m
//  Comfort
//
//  Created by Derek Salerno on 2/4/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "ClarendonLabel.h"

@implementation ClarendonLabel

- (id)initWithCoder:(NSCoder*)aCoder
{
    self = [super initWithCoder:aCoder];
    if (self) {
        self.font = [UIFont fontWithName:@"Clarendon BT" size:20.0];
    }
    return self;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
