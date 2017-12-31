//
//  BaseTableVC.swift
//  ThemeDemo
//
//  Created by GKK on 2017/10/8.
//  Copyright © 2017年 GKK. All rights reserved.
//
import UIKit

class BaseTableVC: UITableViewController {
    
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
        if view.backgroundColorKey == nil {
            view.backgroundColor = Theme.backgroundColor //顶层View
        }
        Theme.shared.updateThemeSubviews(with: view)
    }
}
