//
//  UIFont+FF.m
//  FabFurnish
//
//  Created by Avneesh.minocha on 04/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "UIFont+FF.h"

@implementation UIFont (FF)

+ (UIFont *)ffLightFontWithSize:(ffFontSize)fontSize
{
    return [UIFont fontWithName:@"OpenSans-Light" size:[self fontSize:fontSize]];
}
+ (UIFont *)ffLightItalicFontWithSize:(ffFontSize)fontSize
{
    return [UIFont fontWithName:@"OpenSans-LightItalic" size:[self fontSize:fontSize]];
}
+ (UIFont *)ffRegularFontWithSize:(ffFontSize)fontSize
{
    return [UIFont fontWithName:@"OpenSans" size:[self fontSize:fontSize]];
}
+ (UIFont *)ffSemiBoldFontWithSize:(ffFontSize)fontSize
{
    return [UIFont fontWithName:@"OpenSans-Semibold" size:[self fontSize:fontSize]];
}
+(CGFloat)fontSize:(ffFontSize)size
{
    if (size == ffFontSize10px)return 10.0f;
    else if (size == ffFontSize12px)return 12.0f;
    else if (size == ffFontSize14px)return 14.0f;
    else if (size == ffFontSize16px)return 16.0f;
    return 10.0f;
}

@end
