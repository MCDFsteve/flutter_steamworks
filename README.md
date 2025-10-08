# flutter_steamworks

让 Flutter 开发的桌面游戏、壁纸引擎、桌宠等应用能够直接调用 Steamworks 接口的插件。目前聚焦于 **macOS**，用于在应用启动时向 Steam 客户端上报游玩状态并打通后续 Steam 特性。Windows / Linux 版本仍处于占位阶段，会返回 `false` 而不会触发崩溃，方便后续扩展。

> ⚠️ **最重要的一步：确保在 macOS 构建目标中关闭 App Sandbox。**
>
> 如果不关闭沙箱（Xcode `Signing & Capabilities` → `App Sandbox` 关闭或移除），应用进程无法与 Steam 客户端通信，`initSteam` 会一直失败并无法显示游玩状态。你也可以直接编辑 entitlements 文件来取消沙箱：
> - 修改 `macos/Runner/DebugProfile.entitlements` 与 `macos/Runner/Release.entitlements`，定位 `<key>com.apple.security.app-sandbox</key>`。
> - 将紧随其后的 `<true/>` 替换为 `<false/>`，或连同该键一起删除。
> - 重新构建 Flutter macOS 应用即可验证 Steam 连接是否恢复。

## 特性
- 通过 `initSteam(appId)` 初始化 Steam API，成功后 Steam 会显示对应 AppID 的游玩状态。
- 提供通用的 MethodChannel 封装，Dart 侧仅需传入整数 AppID。
- 自带 macOS 的 `libsteam_api.dylib` 与必要的头文件，避免项目在依赖时拷贝完整 SDK。

## 安装
在目标项目的 `pubspec.yaml` 中添加 git 依赖：

```yaml
dependencies:
  flutter_steamworks:
    git:
      url: https://github.com/MCDFsteve/flutter_steamworks.git
      ref: main   # 或指定 tag/commit
```

执行 `flutter pub get` 拉取依赖。

## 快速上手
```dart
import 'package:flutter_steamworks/flutter_steamworks.dart';

Future<void> setupSteam() async {
  const appId = 480; // Spacewar 测试 AppID，可替换为你自己的游戏 ID
  final steamworks = FlutterSteamworks();

  final ok = await steamworks.initSteam(appId);
  if (!ok) {
    // 处理失败情形，例如提示用户先启动 Steam 客户端
  }
}
```

> 注意：为了让 Steam 正确显示状态，需要：
> 1. 用户本地安装并登录 Steam 客户端。
> 2. AppID 必须是合法的 Steam 应用。如果只是测试，可以用 Valve 提供的 Spacewar(`480`)。
> 3. 在 macOS 上运行时，macOS 会校验应用及依赖项签名。插件内部已对嵌入的 `libsteam_api.dylib` 和插件框架进行 adhoc 签名，如需发布版本请结合自己的签名证书重新处理。

## 可扩展方向
- 目前只实现了 macOS 的初始化逻辑，其它平台的代码仅返回占位值。欢迎提交 PR 一起完善。
- 如果需要更丰富的功能（成就、好友、工作坊等），可以在现有桥接层继续暴露更多 Steam SDK 接口。

## 许可证
MIT License。详细信息见仓库内 `LICENSE` 文件。
