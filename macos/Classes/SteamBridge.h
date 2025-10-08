#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface SteamBridge : NSObject

+ (BOOL)initSteam;
+ (void)shutdown;

@end

NS_ASSUME_NONNULL_END
