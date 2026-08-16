#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface STKURLSessionFactory : NSObject

+ (NSURLSession *)sharedConfiguredSession;

+ (NSURLSessionConfiguration *)defaultConfiguration;

@end

NS_ASSUME_NONNULL_END

