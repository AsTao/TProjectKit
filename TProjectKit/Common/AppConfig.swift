//
//  AppConfig.swift
//  Alamofire
//
//  Created by Tao on 2018/6/20.
//

import UIKit


public class AppConfig: NSObject {
    
    public static var server_url :String = ""
    public static var server_usl_url :String = ""
    public static var server_file_url :String = ""
  
    public static let shared : AppConfig = {
        let instance = AppConfig()
        return instance
    }()
    

    public var navigationTitleColor :UIColor = UIColor.white
    
    public var navigationBarColor :UIColor = UIColor.white
}

extension AppConfig{
    
    public func getUuid() -> String{
        let bundleID = getBundleID()
        if let uuid = self.keychainValueForKey(service: bundleID, key: SwiftKeychainKeyName.UUID.rawValue)  {return uuid}
        if let uuidString = UIDevice.current.identifierForVendor?.uuidString{
            self.setKeychainValue(value: uuidString, service: bundleID, forKey: SwiftKeychainKeyName.UUID.rawValue)
            return uuidString
        }
        return ""
    }
    
    public func getBundleID() -> String{
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleDisplayName")
        return safeString(name)
    }
    public func getVersion() -> String{
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString")
        return safeString(name)
    }
    public func getBundleVersion() -> String{
        let name = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion")
        return safeString(name)
    }
 
    public enum SwiftKeychainKeyName: String {
        case UUID = "UUID"
    }
    public func keychainValueForKey(service :String, key : String) -> String? {
        let item = KeychainPasswordItem(service: service, account: key)
        let value = try? item.readPassword()
        return value
    }
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
