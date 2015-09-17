//
//  UILabel+Attribute.m
//  FabFurnish
//
//  Created by Amit Kumar on 07/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "UILabel+Attribute.h"


@implementation UILabel (Attribute)

-(void) applyAttribute:(NSDictionary *) attribute onText:(NSString *) applyOn {
    
    NSString *completeText = self.text;
    NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];
    
    NSRange attributeRange = [completeText rangeOfString:applyOn];
    
    if (attribute) {
        [attributedString addAttributes:attribute range:attributeRange];
    }
    
    [self setAttributedText:attributedString];
}






//-(void) applyFont:(UIFont *) newFont onText:(NSString *) applyOn {
//    
//    NSString *completeText = self.text;
//    NSMutableAttributedString *attributedString = [self.attributedText mutableCopy];
//    
//    
//    NSRange boldRange = [completeText rangeOfString:applyOn];
//    
//    if (newFont) {
//        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)newFont.fontName, newFont.pointSize, NULL);
//        if (font) {
//            [attributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
//            CFRelease(font);
//        }
//    }
//    
//    [self setAttributedText:attributedString];
//}

//-(NSAttributedString *) attributedString:(NSString *) completeText applyOn:(NSString *) applyOn attribute:(NSDictionary *) attribute{
//    
//    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:completeText];
//    
//    
//    NSRange boldRange = [completeText rangeOfString:applyOn];
//    
//    if (attribute) {
//        [attributedString addAttributes:attribute range:boldRange];
//        }
//    return attributedString;
//    
//}
//
//
//-(NSAttributedString *) attributedString:(NSString *) completeText applyOn:(NSString *) applyOn font:(UIFont *) newFont {
//    
//    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:completeText];
//    
//    
//    NSRange boldRange = [completeText rangeOfString:applyOn];
//    
//    if (newFont) {
//        CTFontRef font = CTFontCreateWithName((__bridge CFStringRef)newFont.fontName, newFont.pointSize, NULL);
//        if (font) {
//            [attributedString addAttribute:(NSString *)kCTFontAttributeName value:(__bridge id)font range:boldRange];
//            CFRelease(font);
//        }
//    }
//    return attributedString;
//}

@end
