//
//  UITextView+Theme.swift
//  Theme.Swift
//
//  Created by gongkai on 2017/5/24.
//  Copyright © 2017年 Theme.Swift. All rights reserved.
//

import UIKit

fileprivate var ThemeUITextViewTextColorKey: UInt8 = 0

extension UITextView {
    
    /// 自动更新文本色的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var textColorKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUITextViewTextColorKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUITextViewTextColorKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
    
}