//
//  Theme.swift
//  Theme.Swift
//
//  Created by gongkai on 2017/5/16.
//  Copyright © 2017年 Theme.Swift. All rights reserved.
//

import UIKit

///主题组件
class Theme: NSObject {
    fileprivate var colors = [String: UIColor]()
    fileprivate var images = [String: String]() //保存图片名
    
    static var shared: Theme = {
        let shared = Theme()
        return shared
    }()
    fileprivate var df = UserDefaults.standard
    
    override init() {
        super.init()
        setup()
    }
    
    fileprivate func setup() {
        let style = self.style
        
        //从应用Bundle中拿相应主题名.theme文件
        let path = Bundle.main.path(forResource: style.rawValue, ofType: "theme")!
        let url = URL(fileURLWithPath: path)
        let string = try! String(contentsOf: url)
        
        if let data = string.data(using: .utf8),
            let json = try? JSONSerialization.jsonObject(with: data, options: []) as? Dictionary<String, Dictionary<String, String>> {
            colors = [:]
            images = [:]
            
            //颜色
            let colorsJSON = json?["colors"]
            colorsJSON?.forEach { (key, value) in
                colors[key] = UIColor(value)
            }
            
            //图片
            let imagesJSON = json?["images"]
            imagesJSON?.forEach { (key, value) in
                images[key] = value
            }
        } else {
            print("theme file read error")
        }
        
        //Keyboard Appearance
        let keyboardAppearance: UIKeyboardAppearance = style == .default ? .default : .dark
        UITextField.appearance().keyboardAppearance = keyboardAppearance
        //UITextView通过appearance设置会crash
        //UITextView.appearance().keyboardAppearance = keyboardAppearance
        
        if style == .default {
            UIApplication.shared.statusBarStyle = .default
        } else {
            UIApplication.shared.statusBarStyle = .lightContent
        }
    }
}

//MARK: - Public
extension Theme {
    
    /// 当前主题
    fileprivate(set) var style: ThemeStyle {
        get {
            if let currentStyleString = df.string(forKey: ThemeCurrentStyle),
                let currentStyle = ThemeStyle(rawValue: currentStyleString)  {
                return currentStyle
            }
            return .default
        }
        set {
            df.set(newValue.rawValue, forKey: ThemeCurrentStyle)
            df.synchronize()
            setup()
            //通知现有页面更新
            NotificationCenter.default.post(name: .ThemeStyleChange, object: nil)
        }
    }
    
    /// 切换主题
    func switchStyle() {
        style = style == .default ? .night : .default
    }
    
    /// 获取当前主题下的颜色
    /// - Parameter key: 颜色名
    /// - Returns:颜色
    func color(forKey key: String) -> UIColor {
        return self.colors[key] ?? UIColor.red //调试模式
    }
    
    /// 获取当前主题下的图片
    /// - Parameter key: 项目Bundle.main中的图片名
    /// - Returns: 颜色
    func image(forKey key: String) -> UIImage {
        if let imageNamed = self.images[key] {
            return UIImage(named: imageNamed)!
        }
        return UIImage()
    }
    
    /// 自动更新到当前主题下的通用样式
    ///
    /// - Parameter view: View
    func updateThemeSubviews(with view: UIView) {
        guard view.autoUpdateTheme else { //不需要自动切换样式
            //更新subviews
            //UIButton中有UILabel，所以不需要更新subviews
            guard !(view is UIButton) else {
                return
            }
            view.subviews.forEach { (subView) in
                updateThemeSubviews(with: subView)
            }
            return
        }
        //各种视图更新
        if let tableView = view as? UITableView {
            //取消当前选择行
            if let selectedRow = tableView.indexPathForSelectedRow {
                tableView.deselectRow(at: selectedRow, animated: false)
            }
            tableView.backgroundColor = Theme.backgroundColor
            tableView.separatorColor = Theme.separatorColor
        }
        else if let cell = view as? UITableViewCell {
            cell.backgroundColor = Theme.cellBackgroundColor
            cell.contentView.backgroundColor = cell.backgroundColor
            cell.selectedBackgroundView?.backgroundColor = Theme.cellSelectedBackgroundColor
        }
        else if let collectionView = view as? UICollectionView {
            collectionView.backgroundColor = Theme.backgroundColor
        }
        else if let cell = view as? UICollectionViewCell {
            cell.backgroundColor = Theme.cellBackgroundColor
            cell.selectedBackgroundView?.backgroundColor = Theme.cellSelectedBackgroundColor
        }
        else if let lab = view as? UILabel {
            if let key = lab.textColorKey {
                lab.textColor = self.color(forKey: key)
            } else {
                lab.textColor = Theme.textColor
            }
        }
        else if let btn = view as? UIButton {
            if let key = btn.titleColorKey {
                btn.setTitleColor(self.color(forKey: key), for: .normal)
            } else {
                btn.setTitleColor(Theme.textColor, for: .normal)
            }
            
            if let key = btn.selectedColorKey {
                btn.setTitleColor(self.color(forKey: key), for: .selected)
            }
        }
        else if let textField = view as? UITextField {
            if let key = textField.textColorKey {
                textField.textColor = self.color(forKey: key)
            } else {
                textField.textColor = Theme.textColor
            }
        }
        else if let textView = view as? UITextView {
            if let key = textView.textColorKey {
                textView.textColor = self.color(forKey: key)
            } else {
                textView.textColor = Theme.textColor
            }

            //UITextView不能通过appearance设置keyboardAppearance，所以在此处设置
            let keyboardAppearance: UIKeyboardAppearance = self.style == .default ? .default : .dark
            textView.keyboardAppearance = keyboardAppearance
        }
        else if let imageView = view as? UIImageView {
            if let key = imageView.imageNamedKey {
                imageView.image = self.image(forKey: key)
            }
        }
        else if let switchView = view as? UISwitch {
            switchView.onTintColor = Theme.switchTintColor
        }
        else if let datePicker = view as? UIDatePicker {
            datePicker.setValue(Theme.textColor, forKey: "textColor")
            datePicker.setValue(false, forKey: "highlightsToday")
        }
        //第三方组件
        else if let lab = view as? UILabel {
            if let key = lab.textColorKey {
                lab.textColor = self.color(forKey: key)
            } else {
                lab.textColor = Theme.textColor
            }
        }
        
        //主题色
        if let key = view.tintColorKey {
            view.tintColor = self.color(forKey: key)
        }
        //背景色
        if let key = view.backgroundColorKey {
            view.backgroundColor = self.color(forKey: key)
        }
        
        //更新subviews
        //UIButton中有UILabel，所以不需要更新subviews
        guard !(view is UIButton) else {
            return
        }
        view.subviews.forEach { (subView) in
            updateThemeSubviews(with: subView)
        }
    }
 
}
