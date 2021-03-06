
//  WebserviceHelper.m


#import "FFWebServiceHelper.h"
//#import "FFSession.h"
#import "Reachability.h"


@interface FFWebServiceHelper ()

@end

@implementation FFWebServiceHelper


- (NSURL *)urlWithString:(NSString *)serviceURL{
    
    NSURL *completeURL;
    // create URL from string to test it contains the host name (complete URL)
    NSURL *checkURL = [NSURL URLWithString:serviceURL];
    NSString *hostName = [checkURL host];
    NSString *urlString;
    
    if (hostName) { // if host name exist
        // its complete URL
        urlString = serviceURL;
    }else{
        // not complete URL
        // append base URL with next URL
        urlString = [NSString stringWithFormat:@"%@%@",BASE_URL,serviceURL];
    }
    
    // create URL object from string url
    NSString* encodedStringURL = [urlString stringByAddingPercentEncodingWithAllowedCharacters:[NSCharacterSet URLQueryAllowedCharacterSet]];
    completeURL = [NSURL URLWithString:encodedStringURL];
    return completeURL;
}

/* 
 
+ (NSMutableURLRequest*)appendCommonHeaderFieldsToRequest:(NSMutableURLRequest*)request {
    
    if ([FFSession sharedSession].sessionIdentifier) {
        // Add Cookie
        NSMutableDictionary *cookieProperties = [NSMutableDictionary new] ;
        [cookieProperties setObject:COOKIE_DOMAIN forKey:NSHTTPCookieDomain];
        [cookieProperties setObject:@"/" forKey:NSHTTPCookiePath];
        [cookieProperties setObject:@"PHPSESSID" forKey:NSHTTPCookieName];
        [cookieProperties setObject:[FFSession sharedSession].sessionIdentifier forKey:NSHTTPCookieValue];
        
        NSHTTPCookie *cookie = [NSHTTPCookie cookieWithProperties:cookieProperties];
        NSArray* cookieArray = [NSArray arrayWithObject:cookie];
        NSDictionary * headers = [NSHTTPCookie requestHeaderFieldsWithCookies:cookieArray];
        [request setAllHTTPHeaderFields:headers];
    }
    
    
    [request setValue:Mobile_Api_Version forHTTPHeaderField:Mobile_Api_Version_Key];
    [request setValue:Mobile_Platform forHTTPHeaderField:Mobile_Platform_Key];

    [request setHTTPShouldHandleCookies:YES];
    return request;
}


-(void)callWebServiceWithUrl:(NSString *)serviceUrl withParameter:(NSMutableDictionary *)parameters onCompletion:(void(^)(eResponseType responseType, id response))completionBlock {
    
    @try {
        
        Reachability *reachability = [Reachability reachabilityWithHostName:@"www.google.com"]; // To test the reachability.
        
        if (reachability.currentReachabilityStatus != NotReachable)
        {
            NSMutableURLRequest *request = nil;
            NSURL *url = [self urlWithString:serviceUrl];
            
            DDLogDebug(@"URL = %@",url);
            DDLogDebug(@"Parameters = %@",parameters);
            
            if (parameters) {
                NSString *CRF_TOKEN = [[FFSession sharedSession] yIICSRFTOKEN];
                ;
                if (CRF_TOKEN) {
                    [parameters setObject:CRF_TOKEN forKey:kKEY_YII_CSRF_TOKEN];
                }
                request = [[AFHTTPRequestSerializer serializer] requestWithMethod:@"POST" URLString:url.absoluteString parameters:parameters error:nil];
            }
            else
            {
                // Create Mutable Request
                request = [[NSMutableURLRequest alloc] initWithURL:url];
                [request setHTTPMethod:@"GET"];
                [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
            }
            
            // Add Common Header fields here
            [FFWebServiceHelper appendCommonHeaderFieldsToRequest:request];
            
            // operation object
            _reqOperation = [[AFHTTPRequestOperation alloc] initWithRequest:request];
            
            // typecasting "self" weak type - because
            //Capturing 'self' strongly in this block is likely to lead to a retain cycle
            __weak typeof(self) weakSelf = self;
            
            [_reqOperation setCompletionBlockWithSuccess:^(AFHTTPRequestOperation *operation, id responseObject)
             {
                 NSString *string = [[NSString alloc] initWithData:responseObject encoding:NSStringEncodingConversionExternalRepresentation];
                 DDLogDebug(@"%@",string);
                 
                 NSError* error;
                 NSDictionary *responseJSON  = [NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions error:&error];
                 
                 if (error == nil)
                 {
                     // JSON response
                     //#warning Complete if needed.
                     // 1- Check if fabfurnish.com server
                     // 2- Call completion block (to send the response to particular class)
                     // 3- Call completion block to Stop Progress Indicator, if it is started from that class.
                     
                     if ([[responseJSON objectForKey:kKEY_success] boolValue]) {
                         
                         // server response.
                         completionBlock(eResponseTypeSuccessJSON,responseJSON);
                     }else{
                         
                         // fabfurnish.com Server response in negative :- "success = false"
                         [weakSelf updateSessionWithDictionary:responseJSON];
                         completionBlock(eResponseTypeFailJSON ,responseJSON);
                     }
                 }
                 else
                 {
                     // not a JSON response.
                     //#warning Complete if needed.
                     // 1- Display some Error message here. OR
                     // 2- Call completion block (to send the response to particular class)
                     // 3- Call completion block to Stop Progress Indicator, if it is started from that class.
                     
                     completionBlock(eResponseTypeNotJSON, nil);
                 }
                 
                 
             } failure:^(AFHTTPRequestOperation *operation, NSError *error) {
                 // failure
                 //#warning Complete if needed.
                 // 1- Display some error message for failure
                 // 2- Call completion block to Stop Progress Indicator, if it is started from that class.
                 
                 // Here is few parameters using those we can display a proper message based on error code
                 //1-error.description,
                 //2-error.localizedDescription,
                 //3-error.localizedFailureReason
                 // OR
                 
                 DDLogError(@"Request did fail with error : %@", error.userInfo);
                 
                 switch (error.code) {
                     case 1001:
                         // Display some messages (Our Message)
                         break;
                     default:
                         // display message based on parameters, error.description
                         break;
                 }
                 
                 completionBlock(eResponseTypeRequestFailure,error);
             }];
            
            [_reqOperation start];
        }else{
            // network not reachable
            // No internet connection.
            
            [SharedModelManager stopProgress];
            [self showAlertWithTitle:@"Network Error" message:kMessageInternetFailure];
        }
        
    }@catch (NSException *exception) {
        
    }
    @finally {
        
    }
}

-(void) updateSessionWithDictionary:(NSDictionary*)dictionary{
    NSDictionary *sessionDic = [dictionary objectForKey:kKEY_session];
    [FFSession modelObjectWithDictionary:sessionDic];
}

-(void)showAlertWithTitle:(NSString *)title message:(NSString*)alertMessage {
    UIAlertView *alertView = [[UIAlertView alloc] initWithTitle:title message:alertMessage delegate:nil cancelButtonTitle:@"OK" otherButtonTitles: nil];
    [alertView show];
}

-(void)startProgressOnOpration:(AFHTTPRequestOperation *)opration
{
    UIActivityIndicatorView *indicatorView = [[UIActivityIndicatorView alloc] init];
    [indicatorView setAnimatingWithStateOfOperation:opration];
}

*/

@end
