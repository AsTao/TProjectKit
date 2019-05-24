//
//  BaseNavigationController.swift
//  Alamofire
//
//  Created by Tao on 2018/6/14.
//

import UIKit


open class BaseNavigationController: UINavigationController {
    
    override open func viewDidLoad() {
        super.viewDidLoad()
        
        navigationBar.tintColor = AppConfig.shared.navigationTitleColor
        navigationBar.barTintColor = AppConfig.shared.navigationBarColor
        navigationBar.titleTextAttributes = [NSAttributedString.Key.foregroundColor:AppConfig.shared.navigationTitleColor]
        
    }

    public func setNavigationBarImage(_ image :UIImage){
        let leftCapWidth = Int(image.size.width * 0.5)
        let topCapHeight = Int(image.size.height * 0.5)
        let newImage = image.stretchableImage(withLeftCapWidth: leftCapWidth, topCapHeight: topCapHeight)
        navigationBar.setBackgroundImage(newImage, for: .top, barMetrics: .default)
    }
    
    ///进入2级页面隐藏tabbar
    override open func pushViewController(_ viewController: UIViewController, animated: Bool) {
        viewController.hidesBottomBarWhenPushed = true
        super.pushViewController(viewController, animated: animated)
    }
    
    ///返回时如果是最上层页面显示tabbar
    override open func popViewController(animated: Bool) -> UIViewController? {
        if viewControllers.count <= 2 {
            viewControllers[0].hidesBottomBarWhenPushed = false
        }
        return super.popViewController(animated: animated)
    }
    
    override open var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        return .portrait
    }
    
    override open var preferredStatusBarStyle: UIStatusBarStyle{
        return .lightContent
    }
    
    
}

