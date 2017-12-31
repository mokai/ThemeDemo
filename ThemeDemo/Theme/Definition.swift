//
//  Definition.swift
//  ThemeDemo
//
//  Created by GKK on 2017/9/26.
//  Copyright © 2017年 GKK. All rights reserved.
//

import Foundation

/// 当前样式UserDefault Key
let ThemeCurrentStyle = "ThemeCurrentStyle"

/// 主题样式
enum ThemeStyle: String {
    case `default` //默认
    case night //夜间
}

extension NSNotification.Name {
    
    /**
     主题样式发生改变，需要重新刷新UI
     **/
    public static let ThemeStyleChange = NSNotification.Name(rawValue: "ThemeStyleChange")
    
}
