//
//  Theme+Colors.swift
//  ThemeDemo
//
//  Created by GKK on 2017/9/26.
//  Copyright © 2017年 GKK. All rights reserved.
//

import UIKit

extension Theme {
    
    fileprivate static func color(_ key: String) -> UIColor {
        return Theme.shared.color(forKey:key)
    }
    fileprivate static func image(_ key: String) -> UIImage {
        return Theme.shared.image(forKey:key)
    }
    
    //导航栏背景色
    static var navigationBarBackgroundColor: UIColor {
        return color("navigationBar_background")
    }
    //Tabbar默认色
    static var tabBarNormalColor: UIColor {
        return color("tabBar_normal")
    }
    //Tabbar选中色
    static var tabBarSelectedColor: UIColor {
        return color("tabBar_selected")
    }
    //Tabbar背景色
    static var tabBarBackgroundColor: UIColor {
        return color("tabBar_background")
    }
    //主题色
    static var tintColor: UIColor {
        return color("tint")
    }
    //页面背景色
    static var backgroundColor: UIColor {
        return color("background")
    }
    //文本色
    static var textColor: UIColor {
        return color("text")
    }
    //分割颜色
    static var separatorColor: UIColor {
        return color("separator")
    }
    //列表Cell背景色
    static var cellBackgroundColor: UIColor {
        return color("cell_background")
    }
    //列表Cell选中背景颜色
    static var cellSelectedBackgroundColor: UIColor {
        return color("cell_selected_background")
    }
    //阴影层颜色
    static var shadowLayerColor: UIColor {
        return color("shadow_layer")
    }
    //Switch主题色
    static var switchTintColor: UIColor {
        return color("switch_tint")
    }
    
}
