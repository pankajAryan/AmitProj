//
//  WebserviceHelper.h



//#import <AFNetworking/AFNetworking.h>

@interface FFWebServiceHelper : NSObject
//@property(nonatomic,strong)AFHTTPRequestOperation *reqOperation;
//-(void) callWebServiceWithUrl:(NSString *)serviceUrl withParameter:(NSMutableDictionary *)dictionary onCompletion:(void(^)(eResponseType responseType, id response))completionBlock;

-(void) updateSessionWithDictionary:(NSDictionary*)dictionary;

+ (NSMutableURLRequest*)appendCommonHeaderFieldsToRequest:(NSMutableURLRequest*)request;

- (NSURL *)urlWithString:(NSString *)serviceURL;

@end


