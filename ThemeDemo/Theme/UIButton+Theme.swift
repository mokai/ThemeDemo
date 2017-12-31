//
//  UIButton+Theme.swift
//  Theme.Swift
//
//  Created by gongkai on 2017/5/23.
//  Copyright © 2017年 Theme.Swift. All rights reserved.
//

import UIKit

fileprivate var ThemeUIButtonTitleColorKey: UInt8 = 0
fileprivate var ThemeUIButtonSelectedColorKey: UInt8 = 1

extension UIButton {
    
    
    /// 自动更新文本色的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var titleColorKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUIButtonTitleColorKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUIButtonTitleColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
    
    /// 自动更新按钮选中色的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var selectedColorKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUIButtonSelectedColorKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUIButtonSelectedColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
