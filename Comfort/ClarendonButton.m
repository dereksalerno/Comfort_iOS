//
//  ClarendonButton.m
//  Comfort
//
//  Created by Derek Salerno on 1/31/13.
//  Copyright (c) 2013 Derek Salerno. All rights reserved.
//

#import "ClarendonButton.h"

@implementation ClarendonButton

- (id)initWithCoder:(NSCoder *)decoder {
    
    if ((self = [super initWithCoder: decoder])) {
        CGRect buttonFrame = self.frame;
        buttonFrame.size = CGSizeMake(150, 70);
        self.frame = buttonFrame;
//        [self.layer setBorderWidth:1.0];
//        [self.layer setBorderColor:[[UIColor blackColor] CGColor]];
        self.layer.cornerRadius = 10; // this value vary as per your desire
        self.clipsToBounds = YES;
        self.titleLabel.textAlignment = NSTextAlignmentCenter;
        self.titleLabel.font = [UIFont fontWithName:@"Clarendon BT" size:18.0];
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
