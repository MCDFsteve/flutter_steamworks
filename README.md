# flutter_steamworks

## 使用示例

```dart
import 'package:flutter_steamworks/flutter_steamworks.dart';

final steamworks = FlutterSteamworks();

Future<void> start() async {
  const appId = 480; // 替换为你自己的 Steam App ID
  final initialized = await steamworks.initSteam(appId);

  if (!initialized) {
    // 处理初始化失败的情况，例如提示用户启动 Steam 客户端
  }
}
```
