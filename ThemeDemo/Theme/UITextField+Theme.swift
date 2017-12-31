//
//  UITextField+Theme.swift
//  Theme.Swift
//
//  Created by gongkai on 2017/5/24.
//  Copyright © 2017年 Theme.Swift. All rights reserved.
//

import UIKit

fileprivate var ThemeUITextFieldTextColorKey: UInt8 = 0

extension UITextField {
    
    /// 自动更新文本色的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var textColorKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUITextFieldTextColorKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUITextFieldTextColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
