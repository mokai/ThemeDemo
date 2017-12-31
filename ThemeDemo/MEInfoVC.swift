//
//  MEInfoVC.swift
//  ThemeDemo
//
//  Created by GKK on 2017/12/31.
//  Copyright © 2017年 GKK. All rights reserved.
//

import UIKit

class MEInfoVC: BaseVC {
    @IBOutlet weak var nightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "我的资料", style: .plain, target: nil, action: nil)
        
        nightSwitch.isOn = Theme.shared.style == .night
    }

    override func updateTheme() {
        super.updateTheme()
        
        //如果在非topViewController中切换，需要对navigationBar做特殊处理
        navigationItem.backBarButtonItem?.tintColor = Theme.tintColor
        updateNavigationBarTheme(navigationController?.navigationBar)
    }
    
    @IBAction func onSwitchChange(_ sender: Any) {
        Theme.shared.switchStyle()
    }

    private func updateNavigationBarTheme(_ view: UIView?) {
        guard let view = view else {
            return
        }
        for subview in view.subviews {
            if let btn = subview as? UIButton { //back button or item
                btn.tintColor = Theme.tintColor
            }
            else if let img = subview as? UIImageView { // back image
                img.tintColor = Theme.tintColor
            } else {
                updateNavigationBarTheme(subview)
            }
        }
    }
}
