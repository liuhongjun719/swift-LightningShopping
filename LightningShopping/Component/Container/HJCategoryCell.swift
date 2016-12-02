//
//  HJCategoryCell.swift
//  LightningShopping
//
//  Created by 123456 on 16/10/12.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit
import SnapKit
import SwiftyJSON

class HJCategoryCell: UICollectionViewCell {
    var itemName: UIButton!
    
    var data: JSON {
        get {
            return self.data
        }
        
        set {
            itemName.setTitle(newValue["name"].stringValue, for: .normal)
        }
    }
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        itemName = UIButton()
        itemName.titleLabel?.font = UIFont.systemFont(ofSize: 12)
        itemName.isUserInteractionEnabled = false
        itemName.setTitleColor(UIColor.black, for: .normal)
        itemName.titleLabel?.textAlignment = .center
        self.addSubview(itemName)
        
        
        itemName.snp.makeConstraints { (make) -> Void in
            make.left.equalTo(10)
            make.right.equalTo(10)
            make.top.equalTo(10)
            make.bottom.equalTo(10)
        }
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
