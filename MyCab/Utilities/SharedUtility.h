//
//  SharedUtility.h
//  FabFurnish
//
//  Created by Pankaj Yadav on 07/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef enum : NSUInteger {
    eUserLoginTypeNotLogin,
    eUserLoginTypeFabFurnish,
    eUserLoginTypeGooglePlus,
    eUserLoginTypeFacebook,
} eUserLoginType;



@interface SharedUtility : NSObject {
    
}

+(void)setLoginType:(eUserLoginType)type;
+(eUserLoginType)loginType;

+ (instancetype)checkForNilValue:(id)object;
  
+ (NSString*)getDeviceIdentifier ;

+(void)saveDatatoUserDefault:(NSString*)data :(NSString*)key;

+(id)retrieveDataFromUserDefault:(NSString*)key;


@end
