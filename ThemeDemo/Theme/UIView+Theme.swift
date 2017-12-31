//
//  UIView+Theme.swift
//  Theme.Swift
//
//  Created by gongkai on 2017/5/23.
//  Copyright © 2017年 Theme.Swift. All rights reserved.
//

import UIKit

fileprivate var ThemeUIViewAutoUpdateThemeKey: UInt8 = 0
fileprivate var ThemeUIViewBackgroundColorKey: UInt8 = 0
fileprivate var ThemeUIViewTintColorKey: UInt8 = 0

extension UIView {
    
    
    /// 是否需要自动更新主题，默认为true，如果为false则Subviews也不自动更新
    @IBInspectable var autoUpdateTheme: Bool {
        get {
            if let autoUpdateTheme = objc_getAssociatedObject(self, &ThemeUIViewAutoUpdateThemeKey) as? Bool {
                return autoUpdateTheme
            } else {
                return true
            }
        }
        set {
            objc_setAssociatedObject(self, &ThemeUIViewAutoUpdateThemeKey, newValue, .OBJC_ASSOCIATION_ASSIGN)
        }
    }
    
    
    /// 自动更新背景色的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var backgroundColorKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUIViewBackgroundColorKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUIViewBackgroundColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    /// 自动更新主题色的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var tintColorKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUIViewTintColorKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUIViewTintColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
