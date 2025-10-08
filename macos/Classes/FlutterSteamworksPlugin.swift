import Cocoa
import FlutterMacOS

public class FlutterSteamworksPlugin: NSObject, FlutterPlugin {
  public static func register(with registrar: FlutterPluginRegistrar) {
    let channel = FlutterMethodChannel(name: "flutter_steamworks", binaryMessenger: registrar.messenger)
    let instance = FlutterSteamworksPlugin()
    registrar.addMethodCallDelegate(instance, channel: channel)
  }

  public func handle(_ call: FlutterMethodCall, result: @escaping FlutterResult) {
    switch call.method {
    case "getPlatformVersion":
      result("macOS " + ProcessInfo.processInfo.operatingSystemVersionString)
    case "initSteam":
      let success = SteamBridge.initSteam()
      result(success)
    default:
      result(FlutterMethodNotImplemented)
    }
  }
}
