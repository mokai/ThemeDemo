//
//  ViewController.swift
//  ThemeDemo
//
//  Created by GKK on 2017/9/26.
//  Copyright © 2017年 GKK. All rights reserved.
//

import UIKit

class MEVC: BaseTableVC {
    @IBOutlet var nightSwitch: UISwitch!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nightSwitch.isOn = Theme.shared.style == .night
        
        //注意，在切换主题页面前的这个UINavigationController中的所有vc需要设置backBarButtonItem，不然BaseNavigationController拿不到默认的backBarButtonItem。
        navigationItem.backBarButtonItem = UIBarButtonItem(title: "我", style: .plain, target: nil, action: nil)
    }
    
    @IBAction func onSwitchChange(_ sender: Any) {
        Theme.shared.switchStyle()
    }
    
}

