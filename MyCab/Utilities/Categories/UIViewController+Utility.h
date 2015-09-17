//
//  UIViewController+Utility.h
//  FabFurnish
//
//  Created by Pankaj Yadav on 07/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "FFValidationResult.h"

@interface UIViewController (Utility)

+ (instancetype)instantiateViewControllerWithIdentifier:(NSString*)storyBoardId fromStoryboard:(NSString*)storyboardName;

-(void) showErrorTSMessage:(NSString*)errorMessage;
-(void) showWarningTSMessage:(NSString*)errorMessage;
-(void) showSuccessTSMessage:(NSString*)errorMessage;
-(void) showResponseErrorWithType:(eResponseType)responseType responseObject:(id)object errorMessage:(NSString*)errorMessage;
-(void) showValidationError:(FFValidationResult*)validationError;
-(void) showAlert:(NSString *)message;
-(void) showCancelAlert:(NSString *)message;

+ (void)showAlertwithTitle:(NSString*)Title message:(NSString*)Message tag:(NSInteger)tag delgate:(id)delegate;

#pragma mark -  Update TabBar Badge

+(void)updateTabBarBadgeOnTabItemType:(kTabItemType)tabItemType;

- (void)setTabBarAnimatedlyHidden:(BOOL)setHidden;


@end
