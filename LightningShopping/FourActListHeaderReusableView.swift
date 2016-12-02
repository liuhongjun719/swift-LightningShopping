//
//  FourActListHeaderReusableView.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/28.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit

class FourActListHeaderReusableView: UICollectionReusableView {
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.init(red: 242/255.0, green: 242/255.0, blue: 242/255.0, alpha: 1.0)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
