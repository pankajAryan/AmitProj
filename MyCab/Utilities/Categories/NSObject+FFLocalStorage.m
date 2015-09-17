//
//  NSObject+FFLocalStorage.m
//  FabFurnish
//
//  Created by Avneesh.minocha on 19/05/15.
//  Copyright (c) 2015 Bluerock eServices Pvt Ltd. All rights reserved.
//

#import "NSObject+FFLocalStorage.h"
#import "FFCatalogResults.h"

#define MAX_RECENT      10
#define MAX_WISHLIST    30


@implementation NSObject (FFLocalStorage)

-(NSString *)keybykModalType:(kModalType)type
{
    NSString *key = @"";
    switch (type) {
        case kModalTypeTeaser:
            key = @"kModalTypeTeaser";
            break;
        case kModalTypeCategory:
            key = @"kModalTypeCategory";
            break;
        case kModalTypeRecent:
            key = @"kModalTypeRecent";
            break;
        case kModalTypeWishList:
            key = @"kModalTypeWishList";
            break;
            
        case kModalTypeSession:
            key = @"kModalTypeSession";
            break;
        case kModalTypeUserProfile:
            key = @"kModalTypeUserProfile";
            break;

        default:
            break;
    }
    return key;
}
-(void)removeLocallyinArray:(kModalType)type
{
    NSMutableArray *array = (NSMutableArray *)[self fetchLocally:type];
    FFCatalogResults *deleteObject = nil;
    FFCatalogResults *result = (FFCatalogResults *)self;
    BOOL isAlreadyIn = NO;
    for (FFCatalogResults *localresult in array) {
        if ([result.resultsIdentifier isEqualToString:localresult.resultsIdentifier])
        {
            isAlreadyIn = YES;
            deleteObject = localresult;
            break;
        }
    }
    if (isAlreadyIn) {
        
        [array removeObjectIdenticalTo:deleteObject];
        [array saveLocally:type];
    }
}
-(void)removeAllinLocal:(kModalType)type
{
    [self removeallData:type];
}
-(BOOL)saveLocallyinArray:(kModalType)type
{
    if (kModalTypeRecent == type) {

        NSMutableArray *array = (NSMutableArray *)[self fetchLocally:type];
        if ([array count] < MAX_RECENT && [array count] > 0) {
            
            BOOL isAlreadyIn = NO;
            FFCatalogResults *result = (FFCatalogResults *)self;
            for (FFCatalogResults *localresult in array) {
                if ([result.resultsIdentifier isEqualToString:localresult.resultsIdentifier]) {
                    isAlreadyIn = YES;
                    break;
                }
            }
            if (!isAlreadyIn) {
                [array insertObject:self atIndex:0];
                [array saveLocally:type];
            }
            return !isAlreadyIn;
        }
        else if ([array count] == MAX_RECENT) {
            
            BOOL isAlreadyIn = NO;
            FFCatalogResults *result = (FFCatalogResults *)self;
            for (FFCatalogResults *localresult in array) {
                if ([result.resultsIdentifier isEqualToString:localresult.resultsIdentifier]) {
                    isAlreadyIn = YES;
                    break;
                }
            }
            if (!isAlreadyIn) {
                [array removeLastObject];
                [array insertObject:self atIndex:0];
                [array saveLocally:type];

            }
            return !isAlreadyIn;
        }
        else
        {
            array = [[NSMutableArray alloc] initWithObjects:self,nil];
            [array saveLocally:type];
            return YES;
        }


    }
    else if (kModalTypeWishList == type) {
        
        NSMutableArray *array = (NSMutableArray *)[self fetchLocally:type];
        if ([array count] < MAX_WISHLIST && [array count] > 0) {
            
            BOOL isAlreadyIn = NO;
            FFCatalogResults *result = (FFCatalogResults *)self;
            for (FFCatalogResults *localresult in array) {
                if ([result.resultsIdentifier isEqualToString:localresult.resultsIdentifier]) {
                    isAlreadyIn = YES;
                    break;
                }
            }
            if (!isAlreadyIn) {
                [array insertObject:self atIndex:0];
                [array saveLocally:type];
            }
            return !isAlreadyIn;
        }
        else if ([array count] == MAX_WISHLIST) {
            
            BOOL isAlreadyIn = NO;
            FFCatalogResults *result = (FFCatalogResults *)self;
            for (FFCatalogResults *localresult in array) {
                if ([result.resultsIdentifier isEqualToString:localresult.resultsIdentifier]) {
                    isAlreadyIn = YES;
                    break;
                }
            }
            if (!isAlreadyIn) {
                [array removeLastObject];
                [array insertObject:self atIndex:0];
                [array saveLocally:type];

            }
            return !isAlreadyIn;
        }
        else
        {
            array = [[NSMutableArray alloc] initWithObjects:self,nil];
            [array saveLocally:type];
            return YES;
        }
        
    }
    return NO;
}
- (void)saveLocally:(kModalType)type
{
    NSData *archivedData = [NSKeyedArchiver archivedDataWithRootObject:self];
    [[NSUserDefaults standardUserDefaults] setObject:archivedData forKey:[self keybykModalType:type]];
    [[NSUserDefaults standardUserDefaults] synchronize];
}
- (instancetype)fetchLocally:(kModalType)type
{
    NSData *archivedData = [[NSUserDefaults standardUserDefaults] objectForKey:[self keybykModalType:type]];
    return [NSKeyedUnarchiver unarchiveObjectWithData:archivedData];
}
-(void)removeallData:(kModalType)type
{
    [[NSUserDefaults standardUserDefaults] removeObjectForKey:[self keybykModalType:type]];
    [[NSUserDefaults standardUserDefaults] synchronize];

}

@end
