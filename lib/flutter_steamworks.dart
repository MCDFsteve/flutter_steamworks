
import 'flutter_steamworks_platform_interface.dart';

class FlutterSteamworks {
  Future<String?> getPlatformVersion() {
    return FlutterSteamworksPlatform.instance.getPlatformVersion();
  }

  /// 初始化 Steam API
  /// 返回 true 表示初始化成功
  Future<bool> initSteam() async {
    return await FlutterSteamworksPlatform.instance.initSteam();
  }
}
