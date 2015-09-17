//
//  UILabel+Attribute.h
//  FabFurnish
//
//  Created by Amit Kumar on 07/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TTTAttributedLabel.h"

@interface UILabel (Attribute)

-(void) applyAttribute:(NSDictionary *) attribute onText:(NSString *) applyOn;

@end
