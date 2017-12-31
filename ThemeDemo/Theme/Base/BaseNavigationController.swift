//
//  BaseNavigationController.swift
//  ThemeDemo
//
//  Created by GKK on 2017/12/30.
//  Copyright © 2017年 GKK. All rights reserved.
//

import UIKit

class BaseNavigationController: UINavigationController {
    
    deinit {
        NotificationCenter.default.removeObserver(self)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateTheme()
        //监听主题改变通知
        NotificationCenter.default.addObserver(self, selector: #selector(self.onThemeChange), name: .ThemeStyleChange, object: nil)
    }
    
    @objc func onThemeChange() {
        UIView.animate(withDuration: 0.25) {
            self.updateTheme()
        }
    }
    
    /// 更新当前ViewController的主题
    func updateTheme() {
        //背景
        let bgImageSize = CGSize(width: view.frame.width, height: 64)
        UIGraphicsBeginImageContext(bgImageSize)
        Theme.navigationBarBackgroundColor.setFill()
        UIGraphicsGetCurrentContext()!.fill(CGRect(origin: CGPoint(), size: bgImageSize))
        let bgImage = UIGraphicsGetImageFromCurrentImageContext()
        UIGraphicsEndImageContext()
        navigationBar.setBackgroundImage(bgImage, for: .default)
        navigationBar.backgroundColor = Theme.navigationBarBackgroundColor
        
        navigationBar.barTintColor = Theme.textColor
        navigationBar.tintColor = Theme.textColor
        navigationBar.titleTextAttributes = [NSAttributedStringKey.foregroundColor: Theme.textColor]
        UIBarButtonItem.appearance().tintColor = Theme.textColor
        //已打开的页面使用appearance无效
        viewControllers.forEach { (vc) in
            vc.navigationItem.backBarButtonItem?.tintColor = Theme.textColor
            vc.navigationItem.leftBarButtonItems?.forEach({ (item) in
                item.tintColor = Theme.textColor
            })
            vc.navigationItem.rightBarButtonItems?.forEach({ (item) in
                item.tintColor = Theme.textColor
            })
        }
    }
}
