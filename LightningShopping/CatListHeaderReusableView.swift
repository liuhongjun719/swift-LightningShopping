//
//  CatListHeaderReusableView.swift
//  LightningShopping
//
//  Created by 123456 on 16/9/28.
//  Copyright © 2016年 123456. All rights reserved.
//

import UIKit

class CatListHeaderReusableView: UICollectionReusableView {
    
    var headerTitle: UILabel!
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.white
        self.addSubview(leftIndicator)
        
        headerTitle = UILabel(frame: CGRect.init(x: 15, y: 0, width: UIScreen.main.bounds.size.width, height: 30))
        headerTitle.backgroundColor = UIColor.clear
        headerTitle.font = UIFont.systemFont(ofSize: 13)
        headerTitle.textAlignment = .left
        headerTitle.textColor = UIColor.init(red: 182/255.0, green: 182/255.0, blue: 182/255.0, alpha: 1.0)
        self.addSubview(headerTitle)
    }
    
    lazy var leftIndicator: UIView = {
        let leftIndicator = UIView()
        leftIndicator.frame = CGRect.init(x: 0, y: 8, width: 5, height: 15)
        leftIndicator.backgroundColor = UIColor.red
        return leftIndicator
    }()
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
