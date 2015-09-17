//
//  FFurls.h
//  FabFurnish
//
//  Created by Avneesh.minocha on 18/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#ifndef FabFurnish_FFurls_h
#define FabFurnish_FFurls_h


#define Mobile_Api_Version_Key        @"XINDFURMOBAPIVERSION"
#define Mobile_Api_Version            @"v1" //ce25302eed61a8a9f2aef604d4b0c11f
#define Mobile_Platform_Key           @"XFABMOBAPIPLATFORM"
#define Mobile_Platform               @"ios"



// 1. ************|| Coockie Configuration ||************ //

// Dev Environment ********
//#define COOKIE_DOMAIN  @".fabteam.in"

//For Staging and Live *******
#define COOKIE_DOMAIN  @".fabfurnish.com"

//Other Environments *********
//#define COOKIE_DOMAIN  @".fabfurnish.loc"




// 2. ************|| WebServices Configuration ||************ //

// Dev Environment ********
//#define BASE_URL  @"http://mapi.fabteam.in/mobileapi/"

//Staging Environment *******
//#define BASE_URL  @"http://alice-staging.fabfurnish.com/mobileapi/"

// *********| Live Environment |*********
//#define BASE_URL  @"http://www.fabfurnish.com/mobileapi/"

// *********| Other Environments |*********
//#define BASE_URL            @"http://qa3526.fabfurnish.loc/mobileapi/"

//#define BASE_URL            @"http://new-analytics.fabteam.in/mobileapi/"  // PUBLIC API ACCESS

#define BASE_URL            @"http://payment.fabteam.in/mobileapi/"



// 3. ************|| WEB-View Implementation ||************ //

//Dev Environment ********
//#define WV_BASE_URL                  @"http://m-mapi.fabteam.in/"

//Staging Environment *******
#define WV_BASE_URL                    @"https://m-staging.fabfurnish.com/"

//Live Environment
//#define WV_BASE_URL                     @"https://m.fabfurnish.com/"

//Other Environments *********

//#define WV_BASE_URL                    @"http://mobile-qa3526.fabfurnish.loc/"





// 2. *************|| add BASE_URL before ||************************************************************ //

#define FIRST_DISCOUNT_COUPON             @"main/firstdiscountcoupon/" //1. Device token URL
#define APP_VERSION                       @"main/versions/"  //2.call on load
#define HOME_PAGE                         @"main/getteaserswebview/"  //3.call on load
#define CATEGORIES                        @"catalog/categories/"  //4.call on load

#define LOGIN                             @"customer/login/"
#define AUTO_LOGIN                        @"customer/checkautologin/"//TO-DO
#define CATEGORYBYID                      @"catalog/categoriesbyparentId?cid=%d"//TO-DO
#define REGISTER                          @"customer/register/" // this is new API
#define CONTACT_US                        @"main/contactus/" //TO-DO

#define MYORDER                           @"cart/cartdata/"
#define ADD_PRODUCT                       @"cart/add/"
#define REMOVE_PRODUCT                    @"cart/remove/"
#define CART_CHANGE_QTY                   @"cart/cartchange/"
#define CUSTOMER_DETAIL                   @"customer/getdetails/" //TO-DO
#define CUSTOMER_LOGOUT                   @"customer/logout/"
#define ADD_VOUCHER                       @"cart/addvoucher/?coupon="
#define REMOVE_VOUCHER                    @"cart/removevoucher/"

#define PRODUCT_AVAILABLE_AT_PINCODE      @"catalog/deliverydetails/"
#define ADD_GIFT_WRAP                     @"cart/giftwrap/"
#define REMOVE_GIFT_WRAP                  @"cart/giftwrapcancel/"
#define EMI_POP                           @"catalog/productemipopup"

//add BASE_URL Before
#define URL_SUGGESTION                    @"search/suggest/?q=%@"
#define URL_SEARCH                        @"search/?q=%@"
#define TRACK_ORDER                       @"customer/trackorder/"//TO-DO
#define FORGOT_PASS                       @"customer/forgotpassword/"//TO-DO
#define MY_ORDER                          @"customer/getmyorderlist/"//TO-DO
#define MY_ORDER_DETAIL                   @"customer/getorderdetail/?order_id=%@"//TO-DO

//add BASE_URL Before
#define CHANGE_PASS                       @"customer/changepass/"
#define MY_ORDER                          @"customer/getmyorderlist/"
#define MY_ORDER_DETAIL                   @"customer/getorderdetail/?order_id=%@"
#define ADD_ADDRESS                       @"customer/address/"
#define GET_REGION                        @"customer/RegionList/"
#define GET_CITY_STATE_BY_PIN             @"customer/pincode/?find=%@"
#define ADD_CMS                           @"main/getcms/"
#define ADD_CALATOG_NEW                   @"catalog/categories/"

#define APP_CMS                           @"main/getcms?key=" //not in use
#define APP_URL_TYPE                      @"main/getUrlType/" //TO-DO Switch/Deep Link
#define SOCIAL_LOGIN                      @"customer/sociallogin/"
#define CUSTOMER_NEWSLETTER               @"customer/newsletter/"


// *******************|| DESIGN & INSPIRATION MODULE ||************************* //

#define API_APPOINTMENT_SERVICES          @"main/appointmentservices"
#define API_MAKE_APPOINTMENT              @"customer/makeappointment"
#define API_SEND_FAQ                      @"catalog/sendfaq"
#define API_FABIDEA_LIKE                      @"social/like/?sku="


// 3. *************|| add WV_BASE_URL before ||*********************************************************** //

#define CHECKOUT_APPEND = "?wt_af=in.android_app.FFApp.1.1.1&utm_source=FFApp&utm_medium=android_app"

#define INITIATE_ORDER_PAYMENT            @"mcheckout/index" // Initiate payment

/**
 *  Check Status of Payment process by redirection URL's
 */
#define SUCCESS                           @"/checkout/success" //TO-DO
#define CHECKOUT_SUCCESS                  @"/checkout/success/msuccess/?s=" // Done
#define ERROR                             @"/mCheckout/error"  //TO-DO
#define CHECKOUT_ERROR                    @"/checkout/error/merror/?s=" //TO-DO


// For Payment whitelist base urls
#define PAY_YOU                           @"https://test.payu.in" //TO-DO
#define String MASTERCARD                 @"https://migs.mastercard.com.au/" //TO-DO
#define CAP_ATTEMPTS_SECURE               @"https://cap.attempts.securecode.com/" //TO-DO

// -----------------------------------

//add WV_BASE_URL Before
#define REDIRECTION                       @"/checkout/redirection" //TO-DO
#define FINISH_PAYMENT                    @"/checkout/finish/payment" //TO-DO
#define WHITELIST_ERROR                   @"/checkout/error" //TO-DO
#define LOGOUT_WEBVIEW                    @"/mcheckout/index/mlogout" //TO-DO
#define LOGIN_REGISTER_SUCCESS_WEBVIEW    @"/mcheckout/common/customerreg" //TO-DO



// After getting out of payment process, use below urls by adding BASE_URL as prefix
#define SUCCESS_ORDER                     @"customer/lastsuccessorderdetail" //TO-DO
#define ERROR_ORDER                       @"customer/lastfailedorder" //TO-DO


// Blacklist URLs
#define MAINTENANCE                       @"/maintenance.php" //TO-DO
#define NOT_FOUND                         @"/index/error" //TO-DO
#define CART_INDEX                        @"/cart/index" //TO-DO

// ----------------------------------

#define ADD_CMS                           @"main/getcms/" //not in use
//add BASE_URL Before
//#define URL_SUGGESTION                    @"search/suggest/"
#define URL_SEARCH                        @"search/?q=%@"
#define TRACK_ORDER                       @"customer/trackorder/"
#define FORGOT_PASS                       @"customer/forgotpassword/"
#define CHANGE_PASS                       @"customer/changepass/"
#define MY_ORDER                          @"customer/getmyorderlist/"
#define MY_ORDER_DETAIL                   @"customer/getorderdetail/?order_id=%@"
#define ADD_ADDRESS                       @"customer/address/"
#define GET_REGION                        @"customer/RegionList/"
#define CUSTOMER_NEWSLETTER               @"customer/newsletter/"
#define GET_CITY_STATE_BY_PIN             @"customer/pincode/?find=%@"
#define ADD_CMS                           @"main/getcms/"
#define ADD_CALATOG_NEW                   @"catalog/categories/"
#define REWRAD_CREDIT_POINTS              @"customer/getpointdetails/"


#define APP_CMS                           @"main/getcms?key="
#define APP_URL_TYPE                      @"main/getUrlType/"

#define CONTACTUS_API                      @"mapi_contactus"
#define WHYFABFURNISH_API                  @"mapi_whyfabfurnish"

//http://mapi.fabteam.in/mobileapi/main/getcms?key=mapi_contactus
//http://mapi.fabteam.in/mobileapi/main/getcms?key=mapi_whyfabfurnish



#endif
