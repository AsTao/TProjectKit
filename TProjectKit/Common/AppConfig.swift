//
//  AppConfig.swift
//  Alamofire
//
//  Created by Tao on 2018/6/20.
//

import UIKit


public class AppConfig: NSObject {
    
    public static let shared : AppConfig = {
        let instance = AppConfig()
        return instance
    }()
    

    public var navigationTitleColor :UIColor = UIColor.white
    public var navigationBarColor :UIColor = UIColor.white
}

extension AppConfig{
    ///获取uuid
    public func getUuid() -> String{
        let bundleID = getBundleID()
        if let uuid = self.keychainValueForKey(service: bundleID, key: SwiftKeychainKeyName.UUID.rawValue)  {return uuid}
        if let uuidString = UIDevice.current.identifierForVendor?.uuidString{
            self.setKeychainValue(value: uuidString, service: bundleID, forKey: SwiftKeychainKeyName.UUID.rawValue)
            return uuidString
        }
        return ""
    }
    ///获取bundleid
    public func getBundleID() -> String{
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName")
        return safeString(name)
    }
    ///获取版
    public func getVersion() -> String{
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        return safeString(name)
    }
    ///获取版构建版本
    public func getBundleVersion() -> String{
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
        return safeString(name)
    }
 
    private enum SwiftKeychainKeyName: String {
        case UUID = "UUID"
    }
    ///往 keychainValue 里存入值
    public func keychainValueForKey(service :String, key : String) -> String? {
        let item = KeychainPasswordItem(service: service, account: key)
        let value = try? item.readPassword()
        return value
    }
    ///读取 keychainValue 里的值
    @discardableResult
    public func setKeychainValue(value: String, service :String, forKey: String) -> Bool {
        let item = KeychainPasswordItem(service: service, account: forKey)
        var success = true
        do {
            try item.savePassword(value)
        } catch {
            success = false
        }
        return success
    }
}
