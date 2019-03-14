//
//  BaseViewController.swift
//  ZPTvStation
//
//  Created by Tao on 2017/10/23.
//  Copyright © 2017年 Tao. All rights reserved.
//

import UIKit

open class BaseViewController : UIViewController {

    override open func viewDidLoad() {
        super.viewDidLoad()

        self.title = " "
        self.navigationController?.interactivePopGestureRecognizer?.isEnabled = true
     
        ///使用默认样式的返回按钮
        let backBarButtonItem = UIBarButtonItem()
        backBarButtonItem.title = ""
        self.navigationController?.navigationBar.backIndicatorImage = UIImage.libBundleImage("back")
        self.navigationController?.navigationBar.backIndicatorTransitionMaskImage = UIImage.libBundleImage("back")
        self.navigationItem.backBarButtonItem = backBarButtonItem;
    }
    
    
    override open func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        AppDelegateInstance.currentViewController = self
    }
    
    override open func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
    }
    
    
    
    ///自定义navigationBar title颜色
    public var navigationTitleColor :UIColor?
    ///自定义navigationBar title
    public var navtitle :String = ""{
        didSet{
            let w = navtitle.compatibleSizeWithFont(UIFont.systemFont(ofSize: 18), width: _SW-100).width + 20
            let label = UILabel(frame: CGRect(x: 0,y: 0,width: w,height: 30))
            label.textAlignment = .center
            label.font = UIFont(name: "STHeitiK-Medium", size: 16)
            label.textColor = navigationTitleColor ?? AppConfig.shared.navigationTitleColor
            label.text = navtitle
            self.navigationItem.titleView = label
        }
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override open  var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
 
    
}


