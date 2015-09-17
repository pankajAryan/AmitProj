//
//  FFProgress.m
//  FabFurnish
//
//  Created by Avneesh.minocha on 19/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "FFProgress.h"

@implementation FFProgress
-(void)awakeFromNib
{
    [super awakeFromNib];
    animatedImage.animationImages = [NSArray arrayWithObjects:
                                     [UIImage imageNamed:@"7"],
                                     [UIImage imageNamed:@"1"],
                                     [UIImage imageNamed:@"2"],
                                     [UIImage imageNamed:@"3"],
                                     [UIImage imageNamed:@"4"],
                                     [UIImage imageNamed:@"5"],
                                     [UIImage imageNamed:@"6"],
                                     nil];
    animatedImage.animationDuration = 1.0;
    [animatedImage startAnimating];

}
@end
