//
//  UIImageView+Theme.swift
//  Theme.Swift
//
//  Created by gongkai on 2017/5/25.
//  Copyright © 2017年 Theme.Swift. All rights reserved.
//

import UIKit

fileprivate var ThemeUIImageViewImageNamedKey: UInt8 = 0

extension UIImageView {
    
    /// 自动更新图片的配置key，需要autoUpdateTheme为true才更新
    @IBInspectable var imageNamedKey: String? {
        get {
            return objc_getAssociatedObject(self, &ThemeUIImageViewImageNamedKey) as? String
        }
        set {
            objc_setAssociatedObject(self, &ThemeUIImageViewImageNamedKey, newValue, .OBJC_ASSOCIATION_COPY_NONATOMIC)
        }
    }
}
