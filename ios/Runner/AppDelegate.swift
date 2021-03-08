import UIKit
import Flutter

@UIApplicationMain
@objc class AppDelegate: FlutterAppDelegate {
    override func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?
    ) -> Bool {
        guard let controller = window?.rootViewController as? FlutterViewController else {
            fatalError("rootViewController is not type FlutterViewController")
        }
        setBaseConfigChannel(controller: controller)
        GeneratedPluginRegistrant.register(with: self)
       if #available(iOS 10.0, *) {
          UNUserNotificationCenter.current().delegate = self as? UNUserNotificationCenterDelegate
        }

        return super.application(application, didFinishLaunchingWithOptions: launchOptions)
    }
}

func setBaseConfigChannel(controller: FlutterViewController) {
    let channel = FlutterMethodChannel(name: Keys.baseConfigChannel, binaryMessenger: controller.binaryMessenger)
    channel.setMethodCallHandler { (call, result) in
        var configDict = [String: Any]()
        let identifier = UIDevice.current.identifierForVendor
        configDict[Keys.baseUrl] = Bundle.main.object(forInfoDictionaryKey:
            Keys.baseUrlPlist) as? String ?? DefaultValue.emptyString
        #if DEBUG
            configDict[Keys.debuggable] = true
        #else
            configDict[Keys.debuggable] = false
        #endif
        configDict[Keys.clientId] = Bundle.main.object(forInfoDictionaryKey:
            Keys.clientIdPlist) as? String ?? DefaultValue.emptyString
        configDict[Keys.clientVersion] = Bundle.main.object(forInfoDictionaryKey: Keys.clientVersion) as? String ?? DefaultValue.emptyString
        configDict[Keys.deviceId] = identifier?.uuidString
        configDict[Keys.packageId] = Bundle.main.object(forInfoDictionaryKey:
            Keys.appIdPlist) as? String ?? DefaultValue.emptyString
        configDict[Keys.afAppId] = Bundle.main.object(forInfoDictionaryKey:
            Keys.afAppId) as? String ?? DefaultValue.emptyString
        configDict[Keys.versionCode] = Bundle.main.object(forInfoDictionaryKey: Keys.versionCodeVersionString) as? String ?? DefaultValue.emptyString
        result(configDict)
    }
}

internal struct DefaultValue {
    static let emptyString = ""
}

