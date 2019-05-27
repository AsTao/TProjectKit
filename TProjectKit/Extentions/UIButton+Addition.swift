//
//  UIButton+Addition.swift
//  Pods-TProjectKit_Example
//
//  Created by tao on 2019/5/24.
//

import UIKit

extension UIButton{
    public class func titleButton(frame :CGRect = .zero,
                                  title :String = "",
                                  titleColor :UIColor = .black,
                                  backgroundColor :UIColor = .white,
                                  target :Any? = nil,
                                  action :Selector) -> UIButton{
        let b = UIButton(frame:frame)
        b.setTitle(title, for: .normal)
        b.setTitleColor(titleColor, for: .normal)
        b.backgroundColor = backgroundColor
        if let t = target {
            b.addTarget(t, action: action, for: .touchUpInside)
        }
        return b
    }
    public class func imageButton(frame :CGRect = .zero,
                                  image :String = "",
                                  target :Any? = nil,
                                  action :Selector) -> UIButton{
        let b = UIButton(frame:frame)
        b.setImage(UIImage(named: image), for: .normal)
        if let t = target {
            b.addTarget(t, action: action, for: .touchUpInside)
        }
        return b
    }
    public class func backgroundImageButton(frame :CGRect = .zero,
                                            image :String = "",
                                            target :Any? = nil,
                                            action :Selector) -> UIButton{
        let b = UIButton(frame:frame)
        b.setBackgroundImage(UIImage(named: image), for: .normal)
        if let t = target {
            b.addTarget(t, action: action, for: .touchUpInside)
        }
        return b
    }
}
