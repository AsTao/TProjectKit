//
//  UILabel+Addition.swift
//  Pods-TProjectKit_Example
//
//  Created by tao on 2019/5/24.
//

import UIKit


extension UILabel{
    class func label(frame :CGRect,text :String?,
                     textColor :UIColor,
                     fontSize :CGFloat,
                     fontWeight :UIFont.Weight = .regular,
                     alignment : NSTextAlignment = .left) -> UILabel{
        let label = UILabel(frame: frame)
        label.font = UIFont.systemFont(ofSize: fontSize, weight: fontWeight)
        label.textAlignment = alignment
        label.textColor = textColor
        label.text = text
        return label
    }
}
