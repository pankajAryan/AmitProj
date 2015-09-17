//
//  UINavigationItem+FF.m
//  FabFurnish
//
//  Created by Avneesh.minocha on 08/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "UINavigationItem+FF.h"

@implementation UINavigationItem (FF)

#pragma mark - BackButton
-(UIBarButtonItem *)ffbackBarbuttonitem:(SEL)lselector withtarget:(id)target
{
    UIImage *backimg = [UIImage imageNamed:@"ArrowBack"];
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:backimg style:UIBarButtonItemStylePlain target:target action:lselector];
    [leftbtn setTintColor:[UIColor ffGrayColor]];
    return leftbtn;
}
#pragma mark - Home Left Slider button
-(UIBarButtonItem *)ffsliderBarbuttonitem:(SEL)lselector withtarget:(id)target
{
    UIImage *image = [UIImage imageNamed:@"Menu"];
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:target action:lselector];
    [leftbtn setTintColor:[UIColor ffGrayColor]];
    return leftbtn;

}
#pragma mark - Right Search button
-(UIBarButtonItem *)ffrightBarbuttonitem:(SEL)rselector withtarget:(id)target
{
    UIImage *searchimage = [UIImage imageNamed:@"search"];
    
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithImage:searchimage style:UIBarButtonItemStylePlain target:target action:rselector];
    [rightbtn setTintColor:[UIColor ffGrayColor]];
    return rightbtn;
    
}
#pragma mark - Titleview With Logo
-(UIButton *)fftitleViewWithTitle:(NSString *)string
{
    UIButton *logoHeader = [UIButton buttonWithType:UIButtonTypeCustom];
    [logoHeader setFrame:CGRectMake(0,0, 220, 44)];
    [logoHeader setTitleEdgeInsets:UIEdgeInsetsMake(0, 5, 0, 0)];
    [logoHeader setImage:[UIImage imageNamed:@"Logo"] forState:UIControlStateNormal];
    [logoHeader setTitle:string forState:UIControlStateNormal];
    [logoHeader.titleLabel setFont:[UIFont ffLightFontWithSize:ffFontSize16px]];
    [logoHeader setTitleColor:[UIColor ffDarkGrayColor] forState:UIControlStateNormal];
    logoHeader.userInteractionEnabled = NO;
    return logoHeader;

}

#pragma mark - Use to make the filter header (not in use now design change)
-(void)configureFilterHeaderWithLeftSelector:(SEL)lselector rightSelector:(SEL)rselector withtarget:(id)target withTitle:(NSString *)string
{
    [self configureTitle:string];
    
    UIButton *clearbtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [clearbtn setFrame:CGRectMake(0, 0, 40, 44)];
    [clearbtn setTitleColor:[UIColor ffOrangeColor] forState:UIControlStateNormal];
    [clearbtn setTitle:@"Clear all" forState:UIControlStateNormal];

    [clearbtn addTarget:target action:lselector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *leftbtn = [[UIBarButtonItem alloc] initWithCustomView:clearbtn];
    self.leftBarButtonItem = leftbtn;
    
    
    UIButton *donebtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [donebtn setFrame:CGRectMake(0, 0, 40, 44)];
    [donebtn setTitle:@"Done" forState:UIControlStateNormal];
    [donebtn setTitleColor:[UIColor ffOrangeColor] forState:UIControlStateNormal];
    [donebtn addTarget:target action:rselector forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithCustomView:donebtn];
    self.rightBarButtonItem = rightbtn;

    
}
#pragma mark - Use to make the search type header
-(void)configureSearchHeaderWithLeftSelector:(SEL)lselector rightSelector:(SEL)rselector withtarget:(id)target withTitle:(NSString *)string
{
    [self configureTitle:string];
    self.leftBarButtonItem = [self ffbackBarbuttonitem:lselector withtarget:target];
//    self.rightBarButtonItem = [self ffrightBarbuttonitem:rselector withtarget:target];
}

#pragma mark - Use to make the home type header
-(void)configureHomeHeaderWithLeftSelector:(SEL)lselector rightSelector:(SEL)rselector withtarget:(id)target withTitle:(NSString *)string
{
    [self setTitleView:[self fftitleViewWithTitle:string]];
    self.leftBarButtonItem = [self ffsliderBarbuttonitem:lselector withtarget:target];
    self.rightBarButtonItem = [self ffrightBarbuttonitem:rselector withtarget:target];
}

// Only Back Button and Title with Logo
-(void)configureHomeHeaderWithLeftSelector:(SEL)lselector withtarget:(id)target withTitle:(NSString *)string
{
    [self setTitleView:[self fftitleViewWithTitle:string]];
    self.leftBarButtonItem = [self ffbackBarbuttonitem:lselector withtarget:target];
}

// Only Back Button and Title
-(void)configureHeaderWithoutLogoWithLeftSelector:(SEL)lselector withtarget:(id)target withTitle:(NSString *)string
{
    [self configureTitle:string];
    self.leftBarButtonItem = [self ffbackBarbuttonitem:lselector withtarget:target];
}

// Only Back Button, DOne button and Title
-(void)configureHeaderWithLeftSelector:(SEL)lselector DoneButtonAtRightSelector:(SEL)rselector target:(id)target withTitle:(NSString *)string
{
    [self configureTitle:string];
    self.leftBarButtonItem = [self ffbackBarbuttonitem:lselector withtarget:target];
    
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithTitle:@"Done"
                                                                 style:UIBarButtonItemStylePlain target:target action:rselector];
    [rightbtn setTintColor:[UIColor ffOrangeColor]];
    
    self.rightBarButtonItem = rightbtn;
}


#pragma mark - Use to make the catalog type header
-(void)configureHomeCatalogueWithLeftSelector:(SEL)lselector rightSelector:(SEL)rselector withtarget:(id)target withTitle:(NSString *)string
{
    [self configureTitle:string];
    self.leftBarButtonItem = [self ffbackBarbuttonitem:lselector withtarget:target];
    self.hidesBackButton  = YES;
    if (rselector) {
        self.rightBarButtonItem = [self ffrightBarbuttonitem:rselector withtarget:target];
    }
}
#pragma mark - Use to make the WishList type header
-(void)configureWishListHeaderWithLeftSelector:(SEL)lselector rightSelector:(SEL)rselector withtarget:(id)target withTitle:(NSString *)string
{
    [self configureTitle:string];
//    UIImage *searchimage = [UIImage imageNamed:@"search"];
    UIBarButtonItem *rightbtn = [[UIBarButtonItem alloc] initWithTitle:@"Clear all"
                                                                 style:UIBarButtonItemStylePlain target:target action:rselector];
    [rightbtn setTintColor:[UIColor ffOrangeColor]];

    self.rightBarButtonItem = rightbtn;
}

#pragma mark - Use to make the titleview with only title
-(void)configureTitle:(NSString *)string
{
    UILabel *headerlbl = [[UILabel alloc] init];
    [headerlbl setTextAlignment:NSTextAlignmentCenter];
    [headerlbl setText:string];
    [headerlbl setFont:[UIFont ffLightFontWithSize:ffFontSize16px]];
    [headerlbl sizeToFit];

    [self setTitleView:headerlbl];
    
}

@end
