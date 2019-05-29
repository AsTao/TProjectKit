//
//  Constants.swift
//  StrategyDemo
//
//  Created by Tao on 15/10/16.
//  Copyright © 2015年 Tao. All rights reserved.
//

import UIKit

public func print(items: Any..., separator: String = " ", terminator: String = "\n") {
    #if DEBUG
        Swift.print(items[0], separator:separator, terminator: terminator)
    #endif
}

#if arch(i386) || arch(x86_64)
public let isSimulator = true
#else
public let isSimulator = false
#endif
///持久化文件路径
public let DocumentsPath = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true)[0]

///屏幕分辨率
public let _scale = UIScreen.main.scale
///屏幕宽度
public let _SW :CGFloat = min(UIScreen.main.bounds.width, UIScreen.main.bounds.height)
///屏幕高度
public let _SH :CGFloat = max(UIScreen.main.bounds.width, UIScreen.main.bounds.height)

///是否是iPad
public let isIpad = UIDevice.current.userInterfaceIdiom == .pad
///是否是iPhone
public let isIphone = UIDevice.current.userInterfaceIdiom == .phone
///系统版本号
public let systemVersion = UIDevice.current.systemVersion

public let iPhone4  = (_SH == 480.0)
public let iPhone5  = (_SH == 568.0)
public let iPhone6  = (_SH == 667.0)
public let iPhonePlus = (_SH == 736.0)
///是否是iPhoneX iPhoneXs iPhoneXr iPhoneXs Max
public let iPhoneX  = (_SH == 812.0 || _SH == 896.0)
///顶部高度（包括statusBar）
public let _TOP :CGFloat = (iPhoneX) ? 88 : 64
///statusBar 高度
public let _SBARH :CGFloat = (iPhoneX) ? 44 : 20
///tabbar 高度
public let _BARH :CGFloat = (iPhoneX) ? 83 : 49
///动态计算长宽比，计算等比放大
public func _ScaleMiddle(_ v: CGFloat) -> CGFloat{return CGFloat(Int(v * (_SW/375)))}
///字符串fromat
public func _S(_ format: String, args: CVarArg...) -> String {return String.init(format: format, args)}
///创建Rect
public func _Rect(_ x: CGFloat = 0, _ y: CGFloat = 0,_ w :CGFloat, _ h :CGFloat) -> CGRect {
    return CGRect(x: x, y: y, width: w, height: h)
}
///创建Size
public func _Size(_ w :CGFloat, _ h :CGFloat) -> CGSize {return CGSize(width: w, height: h)}
///创建Point
public func _Point(_ x: CGFloat, _ y: CGFloat ) -> CGPoint {return CGPoint(x: x, y: y)}
///创建文件路径的URL
public func _FURL(_ str: String) -> URL {return URL(fileURLWithPath: str)}
///创建HTTP URL
public func _URL(_ str: String) -> URL {return URL(string: str) ?? URL(fileURLWithPath: "")}
///创建一个UIImage
public func _IMG(_ str: String) -> UIImage? {return UIImage(named: str)}
///16进制创建UIColor
public func _RGB(_ rgb: UInt) -> UIColor {return UIColor.init(rgb: rgb)}
///带透明度的16进制创建UIColor
public func _ARGB(_ rgb: UInt,a: CGFloat) -> UIColor {return UIColor.init(rgb: rgb, al: a)}
///系统字体
public func _Font(_ size :CGFloat) -> UIFont {return UIFont.systemFont(ofSize: size)}
///系统中字体
public func _MFont(_ size :CGFloat) -> UIFont {return UIFont.systemFont(ofSize: size, weight: .medium)}
///系统粗字体
public func _BFont(_ size :CGFloat) -> UIFont {return UIFont.systemFont(ofSize: size, weight: .bold)}

//重载运算符～～，转换可选值为默认值
postfix operator ~~
postfix public func ~~(i: Int?) -> Int {return i ?? 0}
postfix public func ~~(i: Int32?) -> Int32 {return i ?? 0}
postfix public func ~~(i: Int64?) -> Int64 {return i ?? 0}
postfix public func ~~(i: UInt?) -> UInt {return i ?? 0}
postfix public func ~~(i: UInt32?) -> UInt32 {return i ?? 0}
postfix public func ~~(i: UInt64?) -> UInt64 {return i ?? 0}
postfix public func ~~(i: Bool?) -> Bool {return i ?? false}
postfix public func ~~(i: CGFloat?) -> CGFloat {return i ?? 0}
postfix public func ~~(i: Float?) -> Float {return i ?? 0}
postfix public func ~~(i: Double?) -> Double {return i ?? 0}
postfix public func ~~(i: String?) -> String {return i ?? ""}
postfix public func ~~(i: CGColor?) -> CGColor {return i ?? UIColor.white.cgColor}
postfix public func ~~(i: URL?) -> URL {return i ?? URL.init(string: "url=nil")!}
postfix public func ~~(i: Any?) -> Any {
    switch i {
    case let v as Int:return v
    case let v as Double:return v
    case let v as String:return v
    default:return ""}
}
//返回一个安全的String
public func safeString(_ s :Any?) -> String{
    if let str = s as? String {return str}
    return ""
}
//Number安全转换String
extension String{
    public var safeInt :Int{return Int(self) ?? 0}
    public var safeInt32 :Int32{return Int32(self) ?? 0}
    public var safeInt64 :Int64{return Int64(self) ?? 0}
    public var safeUInt :UInt{return UInt(self) ?? 0}
    public var safeUInt32 :UInt32{return UInt32(self) ?? 0}
    public var safeUInt64 :UInt64{return UInt64(self) ?? 0}
    public var safeBool :Bool{return Bool(self) ?? false}
    public var safeFloat :Float{return Float(self) ?? 0}
    public var safeDouble :Double{return Double(self) ?? 0}
}
//string安全转换Number
extension Int{var str :String{return "\(self)"}}
extension Int32{var str :String{return "\(self)"}}
extension Int64{var str :String{return "\(self)"}}
extension CGFloat{var str :String{return "\(self)"}}
extension Float{var str :String{return "\(self)"}}
extension Double{var str :String{return "\(self)"}}
///主线程延迟调用
public func delay(_ delay: Double,handel : @escaping () -> Void ){
    DispatchQueue.main.asyncAfter(deadline: .now() + delay) {handel()}
}

///appdelegate 实例

public func CurrentViewContrller() -> UIViewController?{
    if let rootViewController = UIApplication.shared.delegate?.window??.rootViewController{
        func findViewController(viewController :UIViewController) -> UIViewController{
            if let nav = viewController as? UINavigationController,let vc = nav.visibleViewController{
                return findViewController(viewController: vc)
            }else if let tabbar = viewController as? UITabBarController,let vc = tabbar.selectedViewController{
                return findViewController(viewController: vc)
            }
            return viewController
        }
        return findViewController(viewController: rootViewController)
    }
    return nil
}

///数据解析Json to Model
public func modelWithJSON<T :Decodable>(_ json :Any) -> T?{
    var object :T?
    do {
        var data :Data?
        if let jsonString = json as? String {
            data = jsonString.data(using: String.Encoding.utf8)
        }else if let jsonDic = json as? [String:Any] {
            data = try JSONSerialization.data(withJSONObject: jsonDic, options: .prettyPrinted)
        }
        guard let d = data else{return object}
        let decoder = JSONDecoder()
        object = try decoder.decode(T.self, from: d)
    }
    catch  {
        debugPrint(error)
    }
    return object
}
///数据解析Json to [Model]
public func modelArrayWithClass<T :Decodable>(_ json :[Any]) -> [T]?{
    var object :[T]?
    do {
        let data = try JSONSerialization.data(withJSONObject: json, options: .prettyPrinted)
        let decoder = JSONDecoder()
        object = try decoder.decode([T].self, from: data)
    }
    catch  {
        debugPrint(error)
    }
    return object
}
///数据解析model to Json
public func modelToJSONString<T :Encodable>(model :T) -> String{
    var object :String = ""
    do {
        let encoder = JSONEncoder()
        let data = try encoder.encode(model)
        object = String(data: data, encoding: .utf8)~~
    }
    catch  {
        debugPrint(error)
    }
    return object
}



