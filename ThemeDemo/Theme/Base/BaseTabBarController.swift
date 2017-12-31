//
//  BaseTabBarController.swift
//  ThemeDemo
//
//  Created by GKK on 2017/12/30.
//  Copyright © 2017年 GKK. All rights reserved.
//

import UIKit

class BaseTabBarController: UITabBarController {
    
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
        tabBar.tintColor = Theme.tabBarSelectedColor
        tabBar.barTintColor = Theme.tabBarBackgroundColor
        tabBar.backgroundColor = Theme.tabBarBackgroundColor
        tabBar.isTranslucent = false
        if #available(iOS 10.0, *) {
            tabBar.unselectedItemTintColor = Theme.tabBarNormalColor
        } else {
            UIView.performWithoutAnimation {
                self.viewControllers?.forEach({ (vc) in
                    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Theme.tabBarNormalColor],
                                                         for: .normal)
                    vc.tabBarItem.setTitleTextAttributes([NSAttributedStringKey.foregroundColor: Theme.tabBarSelectedColor],
                                                         for: .selected)
                })
            }
            
        }
    }

}
