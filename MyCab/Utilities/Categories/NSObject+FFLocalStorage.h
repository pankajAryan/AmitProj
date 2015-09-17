//
//  NSObject+FFLocalStorage.h
//  FabFurnish
//
//  Created by Avneesh.minocha on 19/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, kModalType) {
    // Because we save it in user defaults, so it should not match with other enum value which are also being saved. So Start with 101.
    kModalTypeTeaser = 101,
    kModalTypeCategory,
    kModalTypeRecent,
    kModalTypeWishList,
    
    kModalTypeSession,
    kModalTypeUserProfile
};


@interface NSObject (FFLocalStorage)
- (void)saveLocally:(kModalType)type;
- (instancetype)fetchLocally:(kModalType)type;
-(BOOL)saveLocallyinArray:(kModalType)type;
-(void)removeLocallyinArray:(kModalType)type;
-(void)removeAllinLocal:(kModalType)type;
@end
