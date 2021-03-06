//
//  Constant.h
//  FabFurnish
//
//  Created by Avneesh.minocha on 04/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//
// This class is use to define all constants values any string, number, color, DeviceID, etc.



#ifndef FabFurnish_Constant_h
#define FabFurnish_Constant_h

#import "AppDelegate.h"


#pragma mark - UI page Layouts

#define kFFCatalogLayout @"catalog"
#define kFFWebViewLayout @"webview"
#define kFFFabIdeasLayout @"fab-ideas"
#define kFFFabAdviceLayout @"fab-advice"
#define kFFCuratorsLayout @"curators"
#define kFFIdeaBookLayout @"ideabook"



#pragma mark - iOS SDK Methods

#define SharedModelManager [FFModelManager sharedManager]
#define App_Delegate (AppDelegate*)[[UIApplication sharedApplication] delegate]

//*********************************CONSTANTS********************************************

#pragma mark - Device constants
#define deviceID   [[UIDevice currentDevice] identifierForVendor].UUIDString

#define iPhone4 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 480)

#define iPhone5 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 568)

#define iPhone6 ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 667)

#define iPhone6Plus ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone && MAX([UIScreen mainScreen].bounds.size.height,[UIScreen mainScreen].bounds.size.width) == 736)

#define ScreenHeight [UIScreen mainScreen].bounds.size.height
#define ScreenWidth [UIScreen mainScreen].bounds.size.width


//********|| Public Enumerations ||*********** //
#pragma mark- Public Enums
typedef NS_ENUM(NSUInteger, FFCatalogType) {
    FFCatalogTypeDefault,
    FFCatalogTypeShopTheLook,
};


/*
 *  System Versioning Preprocessor Macros
 */

#define SYSTEM_VERSION_EQUAL_TO(v)                  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedSame)
#define SYSTEM_VERSION_GREATER_THAN(v)              ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedDescending)
#define SYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN(v)                 ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)
#define SYSTEM_VERSION_LESS_THAN_OR_EQUAL_TO(v)     ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedDescending)

//************************************END********************************************


//***************************** NSLocalizedString ***************************************

#define NSLocalizedString(key, comment) [[NSBundle mainBundle] localizedStringForKey:(key) value:@"" table:nil]

//************************************END********************************************


#pragma mark - Constant Strings
//*********************************|| Constant Strings ||*******************************
 
#define kSHARE_EMAIL_SUBJECT NSLocalizedString(@"kSHARE_EMAIL_SUBJECT", nil)

#define kSHARE_APP_SUBJECT NSLocalizedString(@"kSHARE_APP_SUBJECT", nil)

#define kSHARE_APP_BODY_TEXT NSLocalizedString(@"kSHARE_APP_BODY_TEXT", nil)

//************************************END********************************************


#pragma mark - Alert messages
//*********************************ALERT********************************************

#define kMessageMaintenanceFailure NSLocalizedString(@"kMessageMaintenanceFailure", nil)

#define kMessageInternetFailure NSLocalizedString(@"kMessageInternetFailure", nil)
#define kMessageUpdateApp NSLocalizedString(@"kMessageUpdateApp", nil)
#define kMessageSelectAVariant  NSLocalizedString(@"kMessageSelectAVariant", nil)

#define kMessagePlzEntrCouponCode  NSLocalizedString(@"kMessagePlzEntrCouponCode", nil)

#define kMessageEnterPincode  NSLocalizedString(@"kMessageEnterPincode", nil)
#define kMessagePlzEnterMessage  NSLocalizedString(@"kMessagePlzEnterMessage", nil)
#define kMessagePlzEnterSenderName  NSLocalizedString(@"kMessagePlzEnterSenderName", nil)
#define kMessagePlzEnterReceiverName  NSLocalizedString(@"kMessagePlzEnterReceiverName", nil)
#define kMessageSelectBankFirst  NSLocalizedString(@"kMessageSelectBankFirst", nil)
#define kMessageEnterOrderTrackID  NSLocalizedString(@"kMessageEnterOrderTrackID", nil)
#define kMessagePasswordChanged  NSLocalizedString(@"kMessagePasswordChanged", nil)
#define kMessageCouldNotSubscribe  NSLocalizedString(@"kMessageCouldNotSubscribe", nil)
#define kMessageYouAreNotLogin  NSLocalizedString(@"kMessageYouAreNotLogin", nil)
#define kMessageYouHavePlacedNoOrders  NSLocalizedString(@"kMessageYouHavePlacedNoOrders", nil)

#define kMessageEmptyQuesCommentAlert  NSLocalizedString(@"kMessageEmptyQuesCommentAlert", nil)


#pragma mark - Login Screen

#define kMessageNoEmailEntered NSLocalizedString(@"kMessageNoEmailEntered", nil)
#define kMessagePasswordEmpty NSLocalizedString(@"kMessagePasswordEmpty", nil)
#define kMessagePasswordSentOnMail  NSLocalizedString(@"kMessagePasswordSentOnMail", nil)
#define kMessageEmailIdNotRegister  NSLocalizedString(@"kMessageEmailIdNotRegister", nil)

//**********************************END********************************************

#pragma mark - Enums

typedef NS_ENUM(NSUInteger, kProductImageCellType) {
    kProductImageCellTypeProductDetail,
    kProductImageCellTypeTopBanners
};

// Network's Responce Type
typedef enum {
    eResponseTypeModel = 1, // fetch JSON data converted into Model
    eResponseTypeSuccessJSON, //API Response with "success = true"
    eResponseTypeFailJSON, //API Response with "success = false"
    eResponseTypeNotJSON, // Response is not in form of JSON
    eResponseTypeEmptyJSON, // Response is empty = {} // Reserverd
    eResponseTypeRequestFailure, // failure block is called in AFNetworking response
    eResponseTypeNULL, // nil Response
    eResponseTypeIncomplete, // Reserved
    eResponseTypeWaiting, // Reserved
    eResponseTypeUnknown // Reserved
} eResponseType;

typedef NS_ENUM(NSUInteger, kProductDetailScreenComingFrom) {
    kComingFromDefault,
    kComingFromCart,
    kComingFromWishList,
};

typedef NS_ENUM(NSUInteger, kTabItemType) {
    kTabItemTypeWishList,
    kTabItemTypeCart,
};


typedef NS_ENUM(NSUInteger, kPoppedControllerType) {
    kPoppedControllerTypeOrderDetails,
};


#endif

// We will add it in a seperate file which will have only keys of JSON.
#pragma mark- Temporary Constants


#define kFFPostNotification_WishListItemsChange @"kFFPostNotification_WishListItemsChange"

#define kWishListItemsChange_addNew @"kWishListItemsChange_addNew"
#define kWishListItemsChange_remove @"kWishListItemsChange_remove"
#define kWishListItemsChange_clearAll @"kWishListItemsChange_clearAll"


#define kVALUE_High @"High"

#define kKEY_session @"session"
#define kKEY_success @"success"
#define kKEY_messages @"messages"
#define kKEY_metadata @"metadata"
#define kKEY_data @"data"
#define kKEY_version_severity @"version_severity"
#define kKEY_version_code @"version_code"
#define kKEY_YII_CSRF_TOKEN @"YII_CSRF_TOKEN"

#define kKEY_city @"city"
#define kKEY_state @"state"

// Device info token
#define kKEY_device_id @"device_id"
#define kKEY_pushNotificationToken @"notification_id"
#define kKEY_uuid @"uuid"
#define kKEY_type @"type"
#define kKEY_version_code @"version_code"
#define kKEY_version_name @"version_name"
#define kKEY_brand @"brand"
#define kKEY_ip_address @"ip_address"
#define kKEY_model @"model"
#define kKEY_DEVICEDETAILS @"devicedetails"


#pragma Login And Register
//common
#define kVALUE_1 @"1"
#define kVALUE_0 @"0"
#define kVALUE_Male @"Male"
#define kVALUE_Female @"Female"
#define kKEY_loginType @"loginType"
// Login
#define kKEY_LoginForm_email @"LoginForm[email]"
#define kKEY_LoginForm_password @"LoginForm[password]"
// Register
#define kKEY_RegistrationForm_gender                                @"RegistrationForm[gender]"
#define kKEY_RegistrationForm_email                                 @"RegistrationForm[email]"
#define kKEY_RegistrationForm_first_name                            @"RegistrationForm[first_name]"
#define kKEY_RegistrationForm_last_name                             @"RegistrationForm[last_name]"
#define kKEY_RegistrationForm_birthday                              @"RegistrationForm[birthday]"
#define kKEY_RegistrationForm_ip                                    @"RegistrationForm[ip]"
#define kKEY_RegistrationForm_reg_type                              @"RegistrationForm[reg_type]"
#define kKEY_RegistrationForm_is_newsletter_subscribed              @"RegistrationForm[is_newsletter_subscribed]"
#define kKEY_RegistrationForm_contact_number                        @"RegistrationForm[contact_number]"

// Change Password
#define kKEY_PasswordForm_password @"PasswordForm[password]"
#define kKEY_PasswordForm_password2 @"PasswordForm[password2]"
// Forget Password
#define kKEY_ForgotPasswordForm_email @"ForgotPasswordForm[email]"

// Gift wrap
#define kKEY_message @"message"
#define kKEY_receipent_name @"receipent_name"
#define kKEY_sender_name @"sender_name"

// EMI POP Up
#define kKEY_EmiForm_price @"EmiForm[price]"
#define kKEY_EmiForm_shipping_cost @"EmiForm[shipping_cost]"

// Add New Address
#define kKEY_AddressForm_first_name     @"AddressForm[first_name]"
#define kKEY_AddressForm_last_name      @"AddressForm[last_name]"
#define kKEY_AddressForm_phone          @"AddressForm[phone]"
#define kKEY_AddressForm_address1       @"AddressForm[address1]"
#define kKEY_AddressForm_address2       @"AddressForm[address2]"
#define kKEY_AddressForm_postcode       @"AddressForm[postcode]"
#define kKEY_AddressForm_city           @"AddressForm[city]"
#define kKEY_AddressForm_fk_customer_address_region @"AddressForm[fk_customer_address_region]"

// News Letter
#define kKEY_NewsletterForm_newsletter_categories_subscribed @"NewsletterForm[newsletter_categories_subscribed]"


//====================// Dessign & Inspiration Module //====================//

// Make Appointment Form
#define kKEY_AppointmentForm_email      @"AppointmentForm[email]"
#define kKEY_AppointmentForm_name       @"AppointmentForm[name]"
#define kKEY_AppointmentForm_phone      @"AppointmentForm[phone]"
#define kKEY_AppointmentForm_zip        @"AppointmentForm[zip_code]"
#define kKEY_AppointmentForm_comment    @"AppointmentForm[comment]"
#define kKEY_AppointmentForm_services   @"AppointmentForm[services]"


