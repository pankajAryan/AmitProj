//
//  UIViewController+Utility.m
//  FabFurnish
//
//  Created by Pankaj Yadav on 07/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "UIViewController+Utility.h"
#import "FFConstant.h"
#import "WishlistViewController.h"
#import "NSObject+FFLocalStorage.h"
#import "CartViewController.h"
#import "FFSession.h"

@implementation UIViewController (Utility)

+ (instancetype)instantiateViewControllerWithIdentifier:(NSString*)sceneId fromStoryboard:(NSString*)storyboardName {
    
    UIStoryboard *storyboard = [UIStoryboard storyboardWithName:storyboardName bundle:nil];
    UIViewController *viewController = [storyboard instantiateViewControllerWithIdentifier:sceneId];
    
    return viewController;
}


#pragma mark- Error And Alert Messages

-(void) showErrorTSMessage:(NSString*)errorMessage{
    [TSMessage showNotificationWithTitle:errorMessage type:TSMessageNotificationTypeError];
}
-(void) showSuccessTSMessage:(NSString*)errorMessage{
    [TSMessage showNotificationWithTitle:errorMessage type:TSMessageNotificationTypeSuccess];
}
-(void) showWarningTSMessage:(NSString*)errorMessage{
    [TSMessage showNotificationWithTitle:errorMessage type:TSMessageNotificationTypeWarning];
}

-(void) showResponseErrorWithType:(eResponseType)responseType responseObject:(id)object errorMessage:(NSString*)errorMessage{
    // handle error here, it will handle all negative response found in child class.
    
    if (errorMessage) {
        [TSMessage showNotificationWithTitle:errorMessage type:TSMessageNotificationTypeError];
    }else{
        
        switch (responseType) {
                
            case eResponseTypeModel :
                //This Case will never be executed. No Need to display message;
                break;
            case eResponseTypeSuccessJSON:
                // This Case will never be executed. No Need to display message;
                break;
                
            case eResponseTypeFailJSON:
            {
                NSDictionary *response = (NSDictionary *)object;
                NSString *message = [response objectForKey:kKEY_messages];
                [TSMessage showNotificationWithTitle:message type:TSMessageNotificationTypeError];
            }
                break;
            case eResponseTypeNotJSON:
            {
                [TSMessage showNotificationWithTitle:@"Response is not Readable !!" type:TSMessageNotificationTypeError];
            }
                break;
            case eResponseTypeEmptyJSON:
            {
                [TSMessage showNotificationWithTitle:@"Response is Empty !!" type:TSMessageNotificationTypeError];
            }
                break;
            case eResponseTypeRequestFailure:
            {
                
                NSError *error = (NSError *)object;
                switch (error.code) {
                    case 1001: // Some Error
                    {
                        [TSMessage showNotificationWithTitle:@"Error !!" subtitle:[NSString stringWithFormat:@"%@",error.localizedDescription] type:TSMessageNotificationTypeError];
                    }
                        break;
                        
                    default:
                    {
                        [TSMessage showNotificationWithTitle:@"Error !!" subtitle:[NSString stringWithFormat:@"%@",error.localizedDescription] type:TSMessageNotificationTypeError];
                    }
                        break;
                }
                DDLogDebug(@"%ld,%@,%@ - ",(long)error.code,error.description,error);
            }
                break;
            case eResponseTypeNULL:
            {
                [TSMessage showNotificationWithTitle:@"Response is Incomplete !!" type:TSMessageNotificationTypeError];
            }
                break;
            case eResponseTypeIncomplete:
            {
                [TSMessage showNotificationWithTitle:@"Response is Incomplete !!" type:TSMessageNotificationTypeError];
            }
                break;
            case eResponseTypeWaiting:
                //break;
            case eResponseTypeUnknown:
                //break;
                
            default:
            {
                [TSMessage showNotificationInViewController:self title:nil subtitle:@"Error !!" type:TSMessageNotificationTypeError duration:2 canBeDismissedByUser:YES];
                DDLogDebug(@"Error-default: - %@",object);
            }
                break;
        }
    }
}

-(void) showValidationError:(FFValidationResult*)validationError
{
    [TSMessage showNotificationWithTitle:validationError.errorMessage type:TSMessageNotificationTypeError];
}

-(void) showAlert:(NSString *)message{
    
//    [self showAlertWithTitle:message message:nil];
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:message message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}
-(void) showCancelAlert:(NSString *)message{
    [self showCancelAlertWithTitle:message message:nil];
}
-(void) showAlertWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}
-(void) showCancelAlertWithTitle:(NSString *)title message:(NSString *)message{
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:message delegate:self cancelButtonTitle:@"NO" otherButtonTitles:@"YES",nil];
    [alertView show];
}


+ (void)showAlertwithTitle:(NSString*)Title message:(NSString*)Message tag:(NSInteger)tag delgate:(id)delegate
{
    UIAlertView *message = [[UIAlertView alloc] initWithTitle:Title
                                                      message:Message
                                                     delegate:delegate
                                            cancelButtonTitle:@"OK"
                                            otherButtonTitles:nil];
    [message show];
}


#pragma mark - Update update whishList UI & TabBar Badge



+(void)updateTabBarBadgeOnTabItemType:(kTabItemType)tabItemType{
    
    UITabBarController *tabBarCntrl = (UITabBarController*)App_Delegate.window.rootViewController;
    
    if (![tabBarCntrl isKindOfClass:[UITabBarController class]]) {
     
        return;
    }
    
    switch (tabItemType) {
        case kTabItemTypeWishList:
        {
            NSArray *wishListArray = (NSArray *)[self fetchLocally:kModalTypeWishList];
            
            if (wishListArray.count)
                [[[tabBarCntrl viewControllers][1] tabBarItem] setBadgeValue:[NSString stringWithFormat:@"%ld",(unsigned long)wishListArray.count]];
            else
                [[[tabBarCntrl viewControllers][1] tabBarItem] setBadgeValue:nil];
            
        }
            break;
            
        case kTabItemTypeCart:
        {
            NSInteger cartItemCount = (NSInteger)[FFSession sharedSession].cartCount;
            
            if (cartItemCount)
                [[[tabBarCntrl viewControllers][2] tabBarItem] setBadgeValue:[NSString stringWithFormat:@"%ld",(unsigned long)cartItemCount]];
            else
                [[[tabBarCntrl viewControllers][2] tabBarItem] setBadgeValue:nil];

        }
            break;
            
        default:
            break;
    }
    
}

- (void)setTabBarAnimatedlyHidden:(BOOL)setHidden {
    
    if (setHidden) { // Set tab bar hidden Animated.
        
        [UIView animateWithDuration:0.4
                         animations:^(){
                             //self.view_ideaDetail.transform = CGAffineTransformMakeScale(1.0, 1.0);
                             [self.tabBarController.tabBar setAlpha:0];
                             
                         } completion:^(BOOL finished) {
                             [self.tabBarController.tabBar setHidden:YES];
                         }];
    }
    else { // Make tabbar visible
        
        if (self.tabBarController.tabBar.isHidden)
        {
            [self.tabBarController.tabBar setHidden:NO];
            
            [UIView animateWithDuration:0.4
                             animations:^(){
                                 [self.tabBarController.tabBar setAlpha:1];
                             }];
        }

    }
}




@end
