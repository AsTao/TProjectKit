//
//  BaseNiblessView.swift
//  Pods-TProjectKit_Example
//
//  Created by EasyfunDev on 2019/3/14.
//

import UIKit

///frame 布局的View
open class BaseNiblessView: UIView {
    public override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    @available(*, unavailable,message: "loading this view from a nib is unsupported")
    public required init?(coder aDecoder: NSCoder) {
        fatalError("loading this view from a nib is unsupported")
    }
    
}
