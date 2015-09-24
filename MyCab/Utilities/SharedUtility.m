//
//  SharedUtility.m
//  FabFurnish
//
//  Created by Pankaj Yadav on 07/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "SharedUtility.h"


static SharedUtility *utility;

@implementation SharedUtility

+(instancetype)shared{
    if (!utility) {
        utility = [[SharedUtility alloc] init];
    }
    return utility;
}

+ (eUserLoginType)loginType{
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
//    if ([[FFSession sharedSession] is_loggedin]) {
//        return [defaults integerForKey:kKEY_loginType];
//    }
//    else {
        return eUserLoginTypeNotLogin;
//    }
}

+(void)setLoginType:(eUserLoginType)type
{
    
    [[NSNotificationCenter defaultCenter] postNotificationName:@"userLoginStatusDidChange" object:nil];
    
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
//    [defaults setInteger:type forKey:kKEY_loginType];
    [defaults synchronize];
}

+ (instancetype)checkForNilValue:(id)object {
    
    return (object != nil) ? object : @"";
}

+ (NSString*)getDeviceIdentifier {
    NSUUID *id = [[UIDevice currentDevice] identifierForVendor];
    NSString* deviceId = [NSString stringWithFormat:@"%@",[id UUIDString]];
    
    NSCharacterSet *charactersToRemove = [[NSCharacterSet alphanumericCharacterSet] invertedSet];
    NSString *deviceIdAlphanumeric = [[deviceId componentsSeparatedByCharactersInSet:charactersToRemove] componentsJoinedByString:@""];
    
    //DDLogDebug(@"DeviceIdentifier : %@",deviceIdAlphanumeric);
    
    return deviceIdAlphanumeric;
}



+(void)saveDatatoUserDefault:(NSString*)data :(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];

    [prefs setObject:data forKey:key];
    [prefs synchronize];
    //    //DDLogDebug(@"%@",[prefs dictionaryForKey:key]);
}


+(id)retrieveDataFromUserDefault:(NSString*)key
{
    NSUserDefaults *prefs = [NSUserDefaults standardUserDefaults];
    id data = [prefs objectForKey:key];
    
    return data;
}


@end
