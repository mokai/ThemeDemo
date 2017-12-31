//
//  BaseTableViewCell.swift
//  ThemeDemo
//
//  Created by GKK on 2017/12/30.
//  Copyright © 2017年 GKK. All rights reserved.
//

import UIKit

class BaseTableViewCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
        if selectionStyle != .none {
            selectedBackgroundView = UIView(frame: frame)
        }
        Theme.shared.updateThemeSubviews(with: self)
    }

    
    
    
}
