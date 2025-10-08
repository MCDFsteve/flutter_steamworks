#import "SteamBridge.h"
#include "steam_api.h"

@implementation SteamBridge

+ (BOOL)initSteam {
    // 设置 Steam App ID (Spacewar 480)
    setenv("SteamAppId", "480", 1);
    setenv("SteamGameId", "480", 1);

    // 初始化 Steam API
    bool success = SteamAPI_Init();
    if (success) {
        NSLog(@"Steam API initialized successfully");
    } else {
        NSLog(@"Failed to initialize Steam API");
    }
    return success;
}

+ (void)shutdown {
    SteamAPI_Shutdown();
    NSLog(@"Steam API shutdown");
}

@end
